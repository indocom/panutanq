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

  private def event_params
    params.require(:event).permit(:category_id, :name, :description, :start_time, :end_time)
  end
end
