class ImagesController < ApplicationController

  def index
    @images = Image.all
  end


  private

  def image_params
    params.require(:image).permit(:image)
  end
end
