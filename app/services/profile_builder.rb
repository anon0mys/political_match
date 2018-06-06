class ProfileBuilder
  attr_reader :params, :service

  def initialize(survey)
    @survey = survey
    @service = IndicoService.new(@survey)
  end

  def results
    raw_results = @service.analyze[:results]
    summary = profile_summary(raw_results)
    establish_profile(summary)
  end

  private

  def profile_summary(raw_results)
    raw_results.reduce(Hash.new(0)) do |summary, question|
      question.each do |key, value|
        summary[key] += (value * ( 1.0 / raw_results.length ) * 100).round(2)
      end
      summary
    end
  end

  def establish_profile(summary)
    { overall: summary.to_json,
      preferred_party: @survey[:party],
      authority_rating: set_authority(summary),
      social_rating: set_social(summary),
      political_type: set_type(summary)
    }
  end

  def set_authority(summary)
    ratio = ( summary[:Conservative] + summary[:Liberal] ) / ( summary[:Green] + summary[:Libertarian] )
    if ratio <= 1
      (ratio * 5).round(2)
    elsif ratio < 2
      ((ratio - 1) * 5).round(2) + 5
    else
      10
    end
  end

  def set_social(summary)
    ratio = ( summary[:Conservative] + summary[:Libertarian] ) / ( summary[:Green] + summary[:Liberal] )
    if ratio <= 1
      (ratio * 5).round(2)
    elsif ratio < 2
      ((ratio - 1) * 5).round(2) + 5
    else
      10
    end
  end

  def set_type(summary)
    row = get_coord(set_social(summary))
    column = get_coord(set_authority(summary))
    types_map[row][column]
  end

  def get_coord(value)
    if value > 8
      2
    elsif value < 3
      0
    else
      1
    end
  end

  def types_map
    [['Collective Anarchy', 'Nuetral Anarchy', 'Lawless Isolationism'],
     ['Social Democracy', 'Representative Democracy', 'Libertarian Republic'],
     ['Totalitarian Democracy', 'Oligarchy', 'Totalitarian Dictatorship']]
  end
end
