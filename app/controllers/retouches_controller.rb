class RetouchesController < ApplicationController
  before_action :set_retouche, only: [:show, :edit, :update, :destroy]

  def index
    @photographies = Photographie.all
  end

  def show
    if @retouche == nil 
      render :new, status: :unprocessable_entity
    end
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
    @photographie.update(photographie_params)
    redirect_to photography_path(@photographie)
  end

  # def destroy
  #   Cloudinary::Uploader.destroy(@photographie.photo.key)
  #   @photographie.destroy
  #   redirect_to photographies_path, status: :see_other
  # end

  private

  def set_retouche
    @retouche = Retouche.last
  end

  def retouche_params
    params.require(:retouche).permit(:before_photo, :after_photo)
  end
end
