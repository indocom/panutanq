# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @pictures = Picture.where(event_id: @event.id)
    @pictures.each do |picture|
      picture.destroy
    end
    @event.destroy
    redirect_to home_path
  end

  private def event_params
    params.require(:event).permit(:category_id, :name, :description,
                                  :start_time, :end_time, pictures_attributes: [:id, :picture, :_destroy])
  end
end
