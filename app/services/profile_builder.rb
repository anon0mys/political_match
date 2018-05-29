class ProfileBuilder
  attr_reader :params, :service

  def initialize(survey)
    @service = IndicoService.new(survey)
  end

  def results
    @service.analyze
  end
end
