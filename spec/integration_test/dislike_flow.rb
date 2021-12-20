# frozen_string_literal: true

require 'rails_helper'

describe 'Dislike movie', type: :system do
  before do
    @user = create(:user)
    sign_in(@user)
    visit root_path
  end

  let(:valid_youtube_url) { 'https://www.youtube.com/watch?v=C3UJBMAy5xE' }

  scenario 'like a movie' do
    click_link 'Share a movie'
    fill_in 'video[url]', with: valid_youtube_url
    click_button 'Share'
    find('.dislike-link').click

    expect(page).to have_text '1'
  end
end
