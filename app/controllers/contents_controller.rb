class ContentsController < ApplicationController
  before_action :set_photographie, only: [:new, :create, :destroy]

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    @content.photographie = @photographie
    
    if @content.save
      redirect_to photography_path(@photographie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to photography_path(@photographie)
  end

  private

  def content_params
    params.require(:content).permit(photos: [])
  end

  def set_photographie
    @photographie = Photographie.find(params[:photography_id])
  end
end
