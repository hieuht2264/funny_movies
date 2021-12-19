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
class Video < ApplicationRecord
  acts_as_votable

  belongs_to :user

  validates :url, presence: true
end
