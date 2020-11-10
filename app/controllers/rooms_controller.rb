class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else  
      render :new
    end
  end

  def asign
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room_user = RoomUser.new(user_id: current_user.id, room_id: params[:id])

    if @room.authenticate(params[:room][:password])
      unless RoomUser.exists?(user_id: current_user.id, room_id: params[:id])
        @room_user.save
      end
      redirect_to new_room_notice_path(params[:id])
    else
      render :asign
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :password, :user_ids)
  end

  
end
