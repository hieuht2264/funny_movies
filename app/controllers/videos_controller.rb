class VideosController < ApplicationController
  respond_to :js, :html, :json

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params.merge(title: 'hieu', user_id: current_user.id, description: 'hoang'))
    if @video.save
      redirect_to root_path
    else
      render :new
    end
  end

  def like
    @video = Video.find(params[:id])
    if params[:format] == 'like'
      @video.liked_by(current_user)
    elsif params[:format] == 'unlike'
      @video.unliked_by(current_user)
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :url, :description, :user_id)
  end
end