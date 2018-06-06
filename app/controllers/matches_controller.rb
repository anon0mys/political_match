class MatchesController < ApplicationController
  def index
    matcher = ProfileMatcher.new(current_user)
    @political_matches = matcher.political_matches
  end
end
