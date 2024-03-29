class PhotographiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_photographie, only: [:show, :edit, :update, :destroy, :photos]

  def index
    @photographies = Photographie.all
  end

  def delete_all
    @photographies = Photographie.all

    @photographies.each do |photographie|
      photographie.destroy
    end

    @photographies.delete_all
    redirect_to photographies_path, status: :see_other
  end

  def show
    @previous_photographie = Photographie.where("id < ?", @photographie.id).last
    @next_photographie = Photographie.where("id > ?", @photographie.id).first
  end

  def new
    @photographie = Photographie.new
  end
    
  def create
    @photographie = Photographie.new(photographie_params)
  
    if @photographie.save
      redirect_to photography_path(@photographie)
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

  def destroy
    Cloudinary::Uploader.destroy(@photographie.photo.key)
    @photographie.destroy
    redirect_to photographies_path, status: :see_other
  end

  private

  def set_photographie
    @photographie = Photographie.find(params[:id])
  end

  def photographie_params
    params.require(:photographie).permit(:name, :description, :photo)
  end
end
