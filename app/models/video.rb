# frozen_string_literal: true

# == Schema Information
#
# Table name: videos
#
#  id                      :bigint           not null, primary key
#  title                   :string(255)      not null
#  url                     :string(255)      not null
#  description             :text(65535)      not null
#  user_id                 :bigint           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float(24)        default(0.0)
#
class Video < ApplicationRecord
  acts_as_votable

  belongs_to :user

  validates :url, :title, :description, presence: true
end
