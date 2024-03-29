class ContentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_photographie, only: [:new, :create, :destroy, :edit, :update]
  before_action :set_content, only: [:edit, :update, :destroy]

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
    Cloudinary::Uploader.destroy(@content.photo.key)
    @content.destroy
    redirect_to photography_path(@photographie)
  end

  def edit
  end

  def update
    @content.update(content_params)
    redirect_to photography_path(@photographie)
  end

  private

  def content_params
    params.require(:content).permit(photos: [])
  end

  def set_content
    @content = Content.find(params[:id])
  end

  def set_photographie
    @photographie = Photographie.find(params[:photography_id])
  end
end
