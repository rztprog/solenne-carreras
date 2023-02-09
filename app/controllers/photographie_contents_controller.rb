class PhotographieContentsController < ApplicationController
  before_action :set_photographie, only: [:new, :create, :destroy]

  def new
    @photographieContent = PhotographieContent.new
  end

  def create
    @photographieContent = PhotographieContent.new(photographie_content_params)
    @photographieContent.photographie = @photographie
    
    photo_content_type = @photographieContent.photo.content_type
    
    if (photo_content_type.start_with?('image') && @photographieContent.save)
      redirect_to photography_path(@photographie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @photographieContent = PhotographieContent.find(params[:id])
    @photographieContent.destroy
    redirect_to photography_path(@photographie)
  end

  private

  def photographie_content_params
    params.require(:photographie_content).permit(:photo)
  end

  def set_photographie
    @photographie = Photographie.find(params[:photography_id])
  end
end
