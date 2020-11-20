class EventsController < ApplicationController
  before_action :room_find
  before_action :events_get, only: [:index, :show]
  before_action :event_get, only: [:show, :destroy, :edit, :update]

  def index
  end

  def new
    @event = Event.new
  end

  def show
  end

  def create
    @event = @room.events.new(event_params)
    if @event.save
      redirect_to room_events_path(params[:room_id])
    else  
      @events = @room.events.includes(:user)
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to room_events_path(params[:room_id])
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to room_event_path(params[:room_id], @event.id)
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :place, :start_time).merge(user_id: current_user.id, room_id: params[:room_id])
  end

  def room_find
    @room = Room.find(params[:room_id])
  end

  def event_get 
    @event = @room.events.find(params[:id])
  end

  def events_get
    @events = @room.events.includes(:user)
  end
end