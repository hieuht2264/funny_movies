# frozen_string_literal: true

RSpec.describe ApplicationHelper, type: :helper do
  describe '#video_embed_url_generator' do
    subject { helper.video_embed_url_generator(url) }
    let(:url) { 'https://www.youtube.com/watch?v=C3UJBMAy5xE' }

    it {
      is_expected.to eq '<iframe src="//www.youtube.com/embed/C3UJBMAy5xE" width="500" height="280"></iframe>'
    }
  end
end
