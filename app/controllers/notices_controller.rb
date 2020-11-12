class NoticesController < ApplicationController
  def index
  end

  def new
    @room = Room.find(params[:room_id])
    @notices = @room.notices.includes(:user)
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      redirect_to new_room_notice_path(params[:room_id
        ])
    else
      @notices = @room.notices.includes(:user)
      render :new
    end
  end

  def notice_params
    params.require(:notice).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
