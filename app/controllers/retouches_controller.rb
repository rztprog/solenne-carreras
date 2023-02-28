class RetouchesController < ApplicationController
  before_action :set_retouche, only: [:edit, :update, :destroy]

  def index
    @retouches = Retouche.all
  end

  def show
    # if @retouche == nil 
    #   render :new, status: :unprocessable_entity
    # end
  end

  def new
    @retouche = Retouche.new
  end
    
  def create
    @retouche = Retouche.new(retouche_params)
  
    if @retouche.save
      redirect_to retouches_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @retouche.update(retouche_params)
    redirect_to retouches_path
  end

  def destroy
    Cloudinary::Uploader.destroy(@retouche.before_photo.key)
    Cloudinary::Uploader.destroy(@retouche.after_photo.key)
    @retouche.destroy
    redirect_to retouches_path, status: :see_other
  end

  private

  def set_retouche
    @retouche = Retouche.first
  end

  def retouche_params
    params.require(:retouche).permit(:before_photo, :after_photo)
  end
end
