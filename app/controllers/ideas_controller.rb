class IdeasController < ApplicationController

  def new
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.save
    redirect_to category_path(@idea.category)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :notes, :category_id)
  end
end
