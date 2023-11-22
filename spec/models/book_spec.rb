require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:valid_book) { create(:book) }
  let(:invalid_book) { build(:book, :invalid) }

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(1).is_at_most(60) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_length_of(:author).is_at_least(1).is_at_most(60) }
    it { is_expected.to validate_presence_of(:isbn) }
    it { is_expected.to allow_value("123-4-56-789999-0").for(:isbn) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }

    it { is_expected.not_to allow_value("&1hn!").for(:isbn) }

    it "is valid with valid attributes" do
      expect(valid_book).to be_valid
    end

    it "is not valid with invalid attributes" do
      expect(invalid_book).not_to be_valid
    end
  end

  context "attachments" do
    it { is_expected.to have_one_attached(:cover) }
    it { is_expected.to have_one_attached(:content) }
  end

  context 'Database' do
    it 'checks if data is present in the database' do
      expect(valid_book).to be_persisted
    end
  end
end
