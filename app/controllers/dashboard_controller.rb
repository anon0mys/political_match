class DashboardController < ApplicationController
  def show
    @user = current_user
    unless @user.profile.nil?
      @profile = JSON.parse(@user.profile.overall, symbolize_names: true)
    end
  end
end
