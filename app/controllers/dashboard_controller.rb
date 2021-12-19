# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    # @videos = Video.all
    @q = Video.ransack(search_params)
    @videos = @q.result.includes(:user).order(id: :desc).page(params[:page])
  end

  private

  def search_params
    return unless params[:q]

    params.require(:q).permit(:title_cont)
  end
end