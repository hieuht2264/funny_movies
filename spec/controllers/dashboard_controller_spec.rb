# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  before do
    user = create(:user)
    sign_in(user)
  end

  describe '#index' do
    it {
      get :index
      expect(response.status).to eq 200
    }
  end
end
