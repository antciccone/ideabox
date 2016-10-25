class IdeasController < ApplicationController

  def new
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to category_path(@idea.category)
    else
      redirect_to new_idea_path
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :notes, :category_id)
  end
end
