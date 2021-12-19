class VideoDecorator < Draper::Decorator
  delegate_all

  def owner_of_video
    "Shared by: #{object.user.email}"
  end
end
