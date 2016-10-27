class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save

    redirect_to admin_images_path
  end

  def edit

  end

  def update
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
  end
