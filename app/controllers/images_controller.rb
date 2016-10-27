class ImagesController < ApplicationController

  def index
    @images = Image.all
  end
  
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    # @image_ideas = ImageIdea.new
    @image.save
    # @image_ideas.image_id = @image.id
    redirect_to image_path(@image)
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
