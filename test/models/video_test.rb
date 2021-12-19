# == Schema Information
#
# Table name: videos
#
#  id          :bigint           not null, primary key
#  title       :string(255)      not null
#  url         :string(255)      not null
#  description :text(65535)      not null
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
