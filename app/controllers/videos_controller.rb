# frozen_string_literal: true

class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params.merge(title: Faker::Lorem.word, user_id: current_user.id,
                                          description: Faker::Lorem.sentence))
    if @video.save
      flash[:notice] = 'Video was shared successfully.'
    else
      flash[:alert] = 'Something went wrong. Url can not be blank.'
    end
    redirect_to root_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :url, :description, :user_id)
  end
end
