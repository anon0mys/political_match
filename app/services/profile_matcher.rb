class ProfileMatcher
  def initialize(user)
    @profile = user.profile
  end

  def political_matches
    best_matches.map do |match|
      ProfilePresenter.new(match, match.profile)
    end
  end

  private

  def best_matches
    Politician.joins("INNER JOIN profiles ON profiles.owner_id = politicians.id")
              .where('profiles.political_type = ?', Profile.political_types[@profile.political_type])
              .limit(3)
  end
end
