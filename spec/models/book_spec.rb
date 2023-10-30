require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:valid_book) { create(:book) }
  let(:invalid_book) { build(:book, :invalid) }


  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(1).is_at_most(60) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_length_of(:author).is_at_least(1).is_at_most(60) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_least(2).is_at_most(500) }
    it { is_expected.to allow_value(1234567890).for(:isbn) }

    it { is_expected.not_to allow_value("a" * 61).for(:title) }
    it { is_expected.not_to allow_value("a" * 61).for(:author) }
    it { is_expected.not_to allow_value("a").for(:description) }
    it { is_expected.not_to allow_value("a" * 501).for(:description) }

    it "is valid with valid attributes" do
      expect(valid_book).to be_valid
    end

    it "is not valid with invalid attributes" do
      expect(invalid_book).not_to be_valid
    end
  end

  context 'Database' do
    it 'checks if data is present in the database' do
      expect(valid_book).to be_persisted
    end

  end
end
