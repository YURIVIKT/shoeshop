# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should has_one(:cart) }

  describe '.find_for_auth' do
    let!(:user) { create(:user) }
    let(:create_params) { { provider: 'facebook', uid: '123456' } }
    let(:auth) { OmniAuth::AuthHash.new(create_params) }

    context 'user already has auth' do
      it 'returns the user' do
        user.authorization.create(create_params)
        expect(User.find_for_auth(auth)).to eq(user)
      end
    end
  end
end
