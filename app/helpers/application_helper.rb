module ApplicationHelper
  def video_embed_url_generator(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", width: 500, height: 280)
  end
end
