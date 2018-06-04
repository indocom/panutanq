# frozen_string_literal: true

class FreshmenController < ApplicationController
  load_resource find_by: :pagename
  authorize_resource

  def index
    @freshmen = Freshman.all
  end

  def show
    @freshmen = Freshman.all
    @freshman = Freshman.find_by_pagename(params[:id])
  end

  def new
    @freshman = Freshman.new
  end

  def create
    @freshman = Freshman.new(freshman_params)

    if @freshman.save
      redirect_to freshman_path(@freshman)
    else
      render :new
    end
  end

  def edit
    @freshman = Freshman.find_by_pagename(params[:id])
  end

  def update
    @freshman = Freshman.find_by_pagename(params[:id])
    @freshman.update_attributes(freshman_params)

    if @freshman.save
      redirect_to freshmen_path(@freshman)
    else
      render :edit
    end
  end

  def destroy
    @freshman = Freshman.find_by_pagename(params[:id])
    @freshman.destroy
    redirect_to home_path
  end

  private def freshman_params
    params.require(:freshman).permit(:name, :pagename, :description)
  end
end
