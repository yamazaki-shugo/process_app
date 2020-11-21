class DiariesController < ApplicationController
  before_action :room_find
  before_action :diary_get, only: [:show, :edit, :update, :destroy]
  before_action :diaries_get, only: [:index, :show, :edit]

  def index
    @diary = Diary.new
  end

  def new
  end
    
  def create
    @diary = @room.diaries.new(diary_params)
    if @diary.save
      redirect_to room_diaries_path(@room.id)
    else  
      diaries_get
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to room_diary_path(@room.id, @diary.id)
    else 
      diaries_get
      render :edit
    end
  end

  def destroy
    @diary.destroy
    redirect_to room_diaries_path(@room.id)
  end


  private

  def diary_params
    params.require(:diary).permit(:date, :objective, :practice_menu, :discovery, :reflection, :task, :other, :mvp, :image).merge(user_id: current_user.id, room_id: @room.id)
  end

  def room_find
    @room = Room.find(params[:room_id])
  end

  def diary_get
    @diary = @room.diaries.find(params[:id])
  end

  def diaries_get
    @diaries = @room.diaries.includes(:user).order("date DESC")
  end

end