class ProfilesController < ApplicationController
  def new
    @user = current_user
  end

  def create
    profile_builder = ProfileBuilder.new(profile_params)
    user = User.find(params[:user_id])
    profile = user.build_profile(profile_builder.results)
    if profile.save
      redirect_to dashboard_path
    else
      flash[:error] = 'Your profile was not saved'
      redirect_to new_user_profile_path(user)
    end
  end

  private

  def profile_params
  end
end
