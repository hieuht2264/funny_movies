# frozen_string_literal: true

require 'rails_helper'

describe 'Share youtube url', type: :system do
  before do
    @user = create(:user)
    sign_in(@user)
    visit root_path
  end

  let(:valid_youtube_url) { 'https://www.youtube.com/watch?v=C3UJBMAy5xE' }

  scenario 'share with valid youtube url' do
    click_link 'Share a movie'
    fill_in 'video[url]', with: valid_youtube_url
    click_button 'Share'

    expect(page).to have_text "Shared by: #{@user.email}"
    expect(page).to have_text 'Video was shared successfully.'
    expect(page).to have_selector 'iframe'
  end

  scenario 'share with invalid youtube url' do
    click_link 'Share a movie'
    fill_in 'video[url]', with: nil
    click_button 'Share'

    expect(page).to have_no_selector 'iframe'
  end
end
