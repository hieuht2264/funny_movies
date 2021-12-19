# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @q = Video.order(id: :desc).ransack(search_params)
    @videos = @q.result.includes(:user).page(params[:page])
  end

  private

  def search_params
    return unless params[:q]

    params.require(:q).permit(:title_cont)
  end
end