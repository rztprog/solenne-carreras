class PhotographieContentsController < ApplicationController
  before_action :set_photographie, only: [:new, :create, :destroy]

  def new
    @photographieContent = PhotographieContent.new
  end

  def create
    @photographieContent = PhotographieContent.new(photographieContent_params)
    @photographieContent.photographie = @photographie

    if @photographieContent.save
      redirect_to photographie_path(@photographie)
    else
      render :new
    end
  end

  def destroy
    @photographieContent = PhotographieContent.find(params[:id])
    @photographieContent.destroy
    redirect_to photographie_path(@photographie)
  end

  private

  def photographieContent_params
    params.require(:photographieContent).permit()
  end

  def set_photographie
    @photographie = Photographie.find(params[:photography_id])
  end
end
