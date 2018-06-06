class MatchesController < ApplicationController
  def index
    @matches = ProfileMatcher.new(current_user)
  end
end
