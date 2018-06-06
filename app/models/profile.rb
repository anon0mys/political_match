class Profile < ApplicationRecord
  validates_presence_of :overall, :preferred_party,
                        :authority_rating, :social_rating
  belongs_to :owner, polymorphic: true
  before_validation :build_profile

  private

  def build_profile
    self.overall ||= overall
    self.authority_rating ||= set_authority(overall)
    self.social_rating ||= set_social(overall)
    self.political_type ||= set_type
  end

  def set_authority(survey)
    ratio = ( survey[:Conservative].to_f + survey[:Liberal].to_f ) / ( survey[:Green].to_f + survey[:Libertarian].to_f )
    if ratio <= 1
      (ratio * 5).round(2)
    elsif ratio < 2
      ((ratio - 1) * 5).round(2) + 5
    else
      10
    end
  end

  def set_social(survey)
    ratio = ( survey[:Conservative].to_f + survey[:Libertarian].to_f ) / ( survey[:Green].to_f + survey[:Liberal].to_f )
    if ratio <= 1
      (ratio * 5).round(2)
    elsif ratio < 2
      ((ratio - 1) * 5).round(2) + 5
    else
      10
    end
  end

  def set_type
    row = get_coord(self.social_rating)
    column = get_coord(self.authority_rating)
    types_map[row][column]
  end

  def get_coord(value)
    if value > 8
      3
    elsif value < 3
      1
    else
      2
    end
  end

  def types_map
    [['Collective Anarchy', 'Nuetral Anarchy', 'Lawless Isolationism'],
     ['Social Democracy', 'Representative Democracy', 'Libertarian Republic'],
     ['Totalitarian Democracy', 'Oligarchy', 'Totalitarian Dictatorship']]
  end
end
