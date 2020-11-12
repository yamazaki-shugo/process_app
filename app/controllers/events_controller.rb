class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @room = Room.find(params[:room_id])
    @event = Event.new
  end

  def show
    @event = Event.find(params[:room_id], params[:id])
  end

  def create
    @room = Room.find(params[:room_id])
    @event = Event.new(event_parameter)
    if @event.save
      redirect_to room_events_path(params[:room_id])
    else  
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:room_id], params[:id])
    @event.destroy
    redirect_to room_events_path(params[:room_id]), notice: '削除しました'
  end

  def edit
    @event = Event.find(params[:room_id], params[:id])
  end

  def update
    @event = Event.find(params[:room_id], params[:id])
    if @event.update(event_parameter)
      redirect_to room_events_path(params[:room_id]), notice: '編集しました'
    else
      render 'edit'
    end
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
