class PostsController < ApplicationController
  def index
    @schedules = Schedule.all.order(finishdate: "ASC")
  end

  def show
    @schedule = Schedule.find_by(id: params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(post_params())
    
    if @schedule.save
      flash[:success] = "投稿が完了しました。"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @schedule = Schedule.find_by(id: params[:id])
  end

  def update
    @schedule = Schedule.find_by(id: params[:id])
    if @schedule.update(post_params())
      flash[:success] = "メモの編集を完了しました。"
      redirect_to post_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    Schedule.find_by(id: params[:id]).destroy
    flash[:success] = "メモを削除しました"
    redirect_to root_url
  end

private
  def post_params
    if params[:allday] == 1
      params[:allday] = true
    else
      params[:allday] = false
    end
    params.require(:schedule).permit(:title, :startdate, :finishdate, :allday, :memo)
  end

  # def validate_params
  #   if @schedule.finishdate < @schedule.startdate
  #     errors.messages

end
