class DiariesController < ApplicationController
  def index
    @diaries = Diary.includes(:user)
  end

  def new
    @room = Room.find(params[:room_id])
    @diary = Diary.new
  end
    
  def create
    @room = Room.find(params[:room_id])
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to room_diaries_path(@room.id)
    else  
      render :new
    end
  end

  def show
    @room = Room.find(params[:room_id])
    @diary = Diary.find(params[:id])
  end

  def edit
    @room = Room.find(params[:room_id])
    @diary = Diary.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to room_diary_path(@room.id, @diary.id)
    else 
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to room_diaries_path(@room.id)
  end


  private

  def diary_params
    params.require(:diary).permit(:date, :objective, :practice_menu, :discovery, :reflection, :task, :other, :mvp, :image).merge(user_id: current_user.id, room_id: @room.id)
  end
end
