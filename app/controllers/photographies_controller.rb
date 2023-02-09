class PhotographiesController < ApplicationController
  before_action :set_photographie, only: [:show, :edit, :update, :destroy]

  def index
    @photographies = Photographie.all
  end

  def show
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

