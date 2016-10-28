class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.nil?
      flash[:danger] = "User does not exist. Create one below"
      redirect_to login_path
    elsif @user.authenticate(params[:password]) && @user.admin?
      flash[:success] = "You Successfully Logged in!"
      session[:user_id] = @user.id
      redirect_to admin_categories_path
    elsif @user.authenticate(params[:password])
      flash[:success] = "You Successfully Logged in!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:fail] = "Email and password don't match"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You Successfully Logged out!"
    redirect_to login_path
  end
end
