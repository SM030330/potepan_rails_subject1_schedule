class PostsController < ApplicationController
  def index
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(post_params())
    
    if @schedule.save
      flash[:sucses] = "投稿が完了しました。"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def delete
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

end
