# frozen_string_literal: true

class Videos::DislikeController < ApplicationController
  before_action :set_video, only: :update

  def update
    @video.disliked_by(current_user)
    respond_to do |format|
      format.js
    end
    head :no_content
  end

  private

  def set_video
    @video = Video.find(params[:video_id])
  end
end
