class ElementsController < ApplicationController
  before_action :set_graphisme, only: [:new, :create, :destroy, :edit, :update]
  before_action :set_element, only: [:edit, :update, :destroy]

  def new
    @element = Element.new
  end

  def create
    @element = Element.new(element_params)
    @element.graphisme = @graphisme
    
    if @element.save
      redirect_to graphisme_path(@graphisme)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @element.destroy
    redirect_to graphisme_path(@graphisme)
  end

  def purge_photos
    @graphisme = Graphisme.find(params[:id])
    if @graphisme.present?
      @elements = @graphisme.contents.all
  
      @elements.each do |element|
        element.destroy
      end
  
      redirect_to graphisme_path(@graphisme)
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    @element.update(element_params)
    redirect_to graphisme_path(@graphisme)
  end

  private

  def element_params
    params.require(:element).permit(photos: [])
  end

  def set_element
    @element = Element.find(params[:id])
  end

  def set_graphisme
    @graphisme = Graphisme.find(params[:graphisme_id])
  end
end
