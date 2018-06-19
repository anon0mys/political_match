class MatchesController < ApplicationController
  def index
    @matcher = ProfileMatcher.new(current_user)
  end
end
