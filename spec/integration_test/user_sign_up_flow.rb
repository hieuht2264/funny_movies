# frozen_string_literal: true

require 'rails_helper'

describe 'User signs up', type: :system do
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }
  let(:email) { Faker::Internet.email }
  let(:password) { 'Password123!' }

  before do
    visit new_user_registration_path
  end

  scenario 'with valid data' do
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'sign-up-email', with: email
    fill_in 'sign-up-password', with: password
    fill_in 'user[password_confirmation]', with: password
    click_button 'Sign up'

    expect(page).to have_content('Welcome')
    expect(page).to have_link 'Sign out'
  end

  scenario 'invalid when email already exists' do
    user = create :user
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'sign-up-email', with: user.email
    fill_in 'sign-up-password', with: password
    fill_in 'user[password_confirmation]', with: password
    click_button 'Sign up'

    expect(page).to have_no_text 'Welcome back'
    expect(page).to have_text 'Email has already been taken'
  end
end
