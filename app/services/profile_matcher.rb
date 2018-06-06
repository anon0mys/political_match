class ProfileMatcher
  def initialize(user)
    @profile = user.profile
  end

  def best_matches
    Politician.joins("INNER JOIN profiles ON profiles.owner_id = politicians.id")
              .where('profiles.political_type = ?', Profile.political_types[@profile.political_type])
              .where('profiles.preferred_party = ?', @profile.preferred_party)
              .limit(3)
  end
end
