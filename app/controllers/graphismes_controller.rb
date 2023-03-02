class GraphismesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_graphisme, only: [:show, :edit, :update, :destroy]

  def index
    @graphismes = Graphisme.all
  end

  def delete_all
    @graphismes = Graphisme.all

    @graphismes.each do |graphisme|
      graphisme.destroy
    end

    @graphismes.delete_all
    redirect_to graphismes_path, status: :see_other
  end

  def show
    @previous_graphisme = Graphisme.where("id < ?", @graphisme.id).last
    @next_graphisme = Graphisme.where("id > ?", @graphisme.id).first
  end
    
  def new
    @graphisme = Graphisme.new
  end
    
  def create
    @graphisme = Graphisme.new(graphisme_params)

    if @graphisme.save
      redirect_to graphisme_path(@graphisme)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @graphisme.update(graphisme_params)
    redirect_to graphisme_path(@graphisme)
  end

  def destroy
    @graphisme.destroy
    redirect_to graphismes_path, status: :see_other
  end

  private

  def set_graphisme
    @graphisme = Graphisme.find(params[:id])
  end

  def graphisme_params
    params.require(:graphisme).permit(:name, :photo)
  end
end
