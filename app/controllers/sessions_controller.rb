class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user &.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Invalid username or password'
      render login
    end
  end

  def destroy
    session.clear
    flash[:success] = 'Successfully logged out'
    redirect_to root_path
  end
end