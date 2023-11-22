require 'rails_helper'

RSpec.describe User, type: :model do
 let(:valid_user) { create(:user) }
 let(:invalid_user) { build(:user, :invalid_username) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_length_of(:username).is_at_least(4).is_at_most(20) }

  it { is_expected.not_to allow_value("&1hn!").for(:username) }

  it "is valid with valid attributes" do
      expect(valid_user).to be_valid
    end

    it "is not valid with invalid attributes" do
      expect(invalid_user).not_to be_valid
    end

  context 'Database' do
    it 'checks if data is present in the database' do
      expect(valid_user).to be_persisted
    end
  end
end
