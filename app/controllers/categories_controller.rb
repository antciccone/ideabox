class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    #all my ideas display under every category for that idea. problem is on the categories show page
    @user = User.find(session[:user_id]) if !session[:user_id].nil?
    @category = Category.find(params[:id])
    @ideas = @category.ideas
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
