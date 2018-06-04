class FreshmenController < ApplicationController
  load_and_authorize_resource

  def index
    @freshmens = Freshmen.all
  end

  def show
    @freshmen = Freshmen.find(params[:id])
  end

  def new
    @freshmen = Freshmen.new
  end

  def create
    @freshmen = Freshmen.new(freshmen_params)

    if @freshmen.save
      redirect_to freshmen_path(@freshmen)
    else
      render :new
    end
  end

  def edit
    @freshmen = Freshmen.find(params[:id])
  end

  def update
    @freshmen = Freshmen.find(params[:id])
    @freshmen.update_attributes(freshmen_params)

    if @freshmen.save
      redirect_to freshmen_path(@freshmen)
    else
      render :edit
    end
  end

  def destroy
    @freshmen = Freshmen.find(params[:id])
    @pictures = Picture.where(freshmen_id: @freshmen.id)
    @pictures.each do |picture|
      picture.destroy
    end
    @freshmen.destroy
    redirect_to home_path
  end

  private def freshmen_params
    params.require(:freshmen).permit(:category_id, :name, :description)
  end
end
