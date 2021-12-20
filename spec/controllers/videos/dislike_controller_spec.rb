# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Videos::DislikeController, type: :controller do
  before do
    user = create(:user)
    sign_in(user)
  end

  describe 'PATCH /videos/:video_id/dislike' do
    subject do
      patch :update, params: { video_id: video.id }, format: :js
      response
    end

    let(:video) { create(:video) }

    it 'requests successfly' do
      subject
      expect(response.status).to eq 200
    end

    it 'should increase dislike size from 0 to 1' do
      expect { subject }.to change(video.get_dislikes, :size).from(0).to(1)
    end
  end
end
