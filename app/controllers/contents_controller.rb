class ContentsController < ApplicationController
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
    @content.destroy
    redirect_to photography_path(@photographie)
  end

  def purge_photos
    @photographie = Photographie.find(params[:id])
    if @photographie.present?
      @contents = @photographie.contents.all
  
      @contents.each do |content|
        content.destroy
      end
  
      redirect_to photography_path(@photographie)
    else
      redirect_to root_path
    end
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
