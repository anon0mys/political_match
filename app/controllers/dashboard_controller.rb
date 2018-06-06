class DashboardController < ApplicationController
  def show
    @user = current_user
    unless @user.profile.nil?
      @profile = ProfilePresenter.new(@user, @user.profile)
    end
  end
end
