class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @idea = Idea.find(params[:idea_id])
    @image = Image.new(image_params)
    @image_idea = ImageIdea.new
    @image.save
    @image_idea.image_id = @image.id
    @image_idea.idea_id = params[:idea_id]
    @image_idea.save

    redirect_to category_idea_path(@idea.category, @idea)
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
