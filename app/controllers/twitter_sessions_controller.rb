class TwitterSessionsController < ApplicationController
  def create
    response = request.env['omniauth.auth']
    user = User.find_or_initialize_by(twitter_id: response.uid)
    user.name = response.info.name
    user.email = response.info.email
    user.password = response.credentials.secret
    user.twitter_token = response.credentials.token
    user.twitter_secret = response.credentials.secret

    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in'
      redirect_to dashboard_path
    else
      flash[:error] = 'Invalid username or password'
      render 'sessions/new'
    end
  end
end
