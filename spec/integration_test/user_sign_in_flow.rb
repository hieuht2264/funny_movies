# frozen_string_literal: true

require 'rails_helper'

describe 'User signs in', type: :system do
  before do
    @user = create :user
    visit root_path
  end

  scenario 'valid with correct credentials' do
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Sign in'

    expect(page).to have_text "Welcome #{@user.email}"
    expect(page).to have_link 'Share a movie'
    expect(page).to have_link 'Sign out'
  end

  scenario 'invalid with unregistered account' do
    fill_in 'user[email]', with: Faker::Internet.email
    fill_in 'user[password]', with: 'FakePassword123'
    click_button 'Sign in'

    expect(page).to have_no_text "Welcome #{@user.email}"
    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_no_link 'Sign Out'
  end

  scenario 'invalid with invalid password' do
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: 'FakePassword123'
    click_button 'Sign in'

    expect(page).to have_no_text "Welcome #{@user.email}"
    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_no_link 'Sign Out'
  end
end
