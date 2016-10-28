class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @user = User.find(session[:user_id]) if !session[:user_id].nil?
    @category = Category.find(params[:id])
    @ideas = @category.ideas
    @users_ideas = @user.ideas.where(category_id: @category.id) if !session[:user_id].nil?
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
