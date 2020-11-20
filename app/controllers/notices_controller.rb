class NoticesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @notices = @room.notices.includes(:user).order("created_at DESC")
    @notice = Notice.new
  end

  def new
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      redirect_to room_notices_path(params[:room_id
        ])
    else
      @notices = @room.notices.includes(:user)
      render :index
    end
  end

  def notice_params
    params.require(:notice).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
