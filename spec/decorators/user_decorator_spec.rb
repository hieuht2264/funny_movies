# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserDecorator do
  describe '#welcome' do
    subject { user.decorate.welcome }

    let(:user) { create(:user) }

    it 'response format!' do
      expect(subject).to eq "Welcome #{user.email}"
    end
  end
end
