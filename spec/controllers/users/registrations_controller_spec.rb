# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe 'POST /users/sign_up' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    subject do
      post :create, params: params
      response
    end

    let(:params) do
      {
        user: {
          first_name: first_name,
          last_name: last_name,
          email: email,
          password: password,
          password_confirmation: password_confirmation
        }
      }
    end

    context 'when case invalid' do
      let(:first_name) { '' }
      let(:last_name) { '' }
      let(:email) { nil }
      let(:password) { 'Password123!' }
      let(:password_confirmation) { 'Password123!' }

      it 'should render!' do
        subject
        expect(response.status).to eq 200
      end
    end

    context 'when case valid' do
      let(:first_name) { 'hieu' }
      let(:last_name) { 'hoang' }
      let(:email) { 'hieu@gmail.com' }
      let(:password) { 'Password123!' }
      let(:password_confirmation) { 'Password123!' }

      it 'should redirect!' do
        subject
        expect(response.status).to eq 302
      end

      it 'response!' do
        subject
        expect(request.flash[:notice]).to eq('Welcome! You have signed up successfully.')
      end
    end
  end
end
