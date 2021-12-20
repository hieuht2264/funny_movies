# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  before do
    user = create(:user)
    sign_in(user)
  end

  describe 'GET /videos/new' do
    subject do
      get :new
      response
    end

    it 'requests successfly' do
      subject
      expect(response.status).to eq 200
    end
  end

  describe 'POST /videos' do
    let(:params) do
      {
        video: {
          url: url
        }
      }
    end

    subject do
      post :create, params: params
      response
    end

    context 'when case nil youtube url' do
      let(:url) { nil }

      it 'should redirect and show message!' do
        subject
        expect(request.flash[:alert]).to eq('Something went wrong. Url can not be blank.')
        expect(response.status).to eq 302
      end
    end

    context 'when case invalid youtube url' do
      let(:url) { 'invalid url' }

      it 'should create a record and show message!' do
        expect { subject }.to change(Video, :count).from(0).to(1)
        expect(request.flash[:notice]).to eq('Video was shared successfully.')
        expect(response.status).to eq 302
      end
    end

    context 'when case valid youtube url' do
      let(:url) { 'https://www.youtube.com/watch?v=nfWlot6h_JM' }

      it 'should create a record and show message!' do
        expect { subject }.to change(Video, :count).from(0).to(1)
        expect(response.status).to eq 302
        expect(request.flash[:notice]).to eq('Video was shared successfully.')
      end
    end
  end
end
