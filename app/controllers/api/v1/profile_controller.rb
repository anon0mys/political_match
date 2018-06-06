class Api::V1::ProfileController < ApiController
  def show
    render json: current_user.profile.overall
  end
end
