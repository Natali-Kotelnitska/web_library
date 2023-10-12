require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:valid_book) { create(:book) }
  let(:invalid_book) { build(:book, title: nil) }

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:title).is_at_least(2).with_message("Title isn't long enough") }
    it { should validate_length_of(:description).is_at_least(2).is_at_most(500) }
    it { should allow_value('1234567890').for(:isbn) }
  end

  it "is valid with valid attributes" do
    expect(valid_book).to be_valid
  end

  it "is not valid without a title" do
    expect(invalid_book).not_to be_valid
  end
end
