class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Account successfully created'
      redirect_to dashboard_path
    else
      flash[:error] = 'Account not created'
      render :new
    end
  end

  def update
    @user = current_user
    params = user_params
    if params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
      flash[:warning] = 'Password not updated'
    end
    if @user.update(user_params)
      flash[:success] = 'Account successfully updated'
      redirect_to dashboard_path
    else
      flash[:error] = 'You are missing required user information'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :state, :password, :password_confirmation)
  end
end
