class Api::V1::MatchesController < ApiController
  def index
    matcher = ProfileMatcher.new(current_user)
    render json: matcher.political_matches
  end
end
