class IdeasController < ApplicationController

  def new
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = session[:user_id]
    if @idea.save
      redirect_to category_path(@idea.category)
    else
      redirect_to new_idea_path
    end
  end

  def show
    @image = Image.new
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
    @categories = Category.all
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to category_idea_path(@idea.category, @idea)
    else
      redirect_to edit_idea_path
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to category_path(@idea.category)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :notes, :category_id, :user_id)
  end
end
