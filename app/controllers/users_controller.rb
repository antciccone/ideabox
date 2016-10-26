class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param) #need to pass password and password confirmation in strong params 
    if @user.save
      flash[:success] = "You have successfully created a user"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
