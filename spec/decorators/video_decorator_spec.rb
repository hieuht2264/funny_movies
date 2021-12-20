# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VideoDecorator do
  describe '#owner_of_video' do
    subject { video.decorate.owner_of_video }

    let(:user) { create(:user) }
    let(:video) { create(:video, user: user) }

    it 'response format!' do
      expect(subject).to eq "Shared by: #{user.email}"
    end
  end
end
