class ProfileBuilder
  attr_reader :params, :service

  def initialize(survey)
    @service = IndicoService.new(survey)
  end

  def results
    raw_results = @service.analyze[:results]
    {overall: profile_summary(raw_results).to_json}
  end

  private

  def profile_summary(raw_results)
    raw_results.reduce(Hash.new(0)) do |summary, question|
      question.each do |key, value|
        summary[key] += (value * ( 1.0 / raw_results.length )).round(2)
      end
      summary
    end
  end
end
