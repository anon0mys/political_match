class ProfileMatcher
  attr_reader :profile
  
  def initialize(user)
    @user = user
    @profile = user.profile
  end

  def political_matches
    best_matches.map do |match|
      ProfilePresenter.new(match, match.profile)
    end
  end

  def state_politicians
    politicians = Politician.where(state: @user.state)
    politicians.map do |politician|
      ProfilePresenter.new(politician, politician.profile)
    end
  end

  private

  def best_matches
    Politician.joins("INNER JOIN profiles ON profiles.owner_id = politicians.id")
              .where('profiles.political_type = ?', Profile.political_types[@profile.political_type])
              .limit(3)
  end
end
