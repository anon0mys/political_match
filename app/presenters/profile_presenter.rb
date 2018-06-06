class ProfilePresenter
  def initialize(model, profile)
    @model = model
    @profile = profile
  end

  def political_type
    @profile.political_type
  end

  def preferred_party
    if @model.is_a?(Politician)
      match_party[@profile.preferred_party]
    else
      @profile.preferred_party
    end
  end

  def authority_rating
    @profile.authority_rating
  end

  def social_rating
    @profile.social_rating
  end

  def overall
    JSON.parse(@profile.overall, symbolize_names: true)
  end

  private

  def match_party
    { 'D' => 'Democrat',
      'R' => 'Republican',
      'I' => 'Independent' }
  end
end
