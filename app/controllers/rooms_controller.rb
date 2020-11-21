class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_notices_path(@room.id)
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
      @room_user.save unless RoomUser.exists?(user_id: current_user.id, room_id: params[:id])
      redirect_to room_notices_path(params[:id])
    else
      render :asign
    end
  end

  def search
    if params[:name].present?
      @rooms = Room.where('name LIKE ?', "%#{params[:name]}%")
    else
      @rooms = Room.none #空の結果を返す
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :password, :user_ids)
  end

  
end
