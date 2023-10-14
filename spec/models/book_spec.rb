require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:valid_book) { create(:book) }

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(1).is_at_most(60) }
    it { should validate_presence_of(:author) }
    it { should validate_length_of(:author).is_at_least(1).is_at_most(60) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(2).is_at_most(500) }
    it { should allow_value("1234567890").for(:isbn) }
  end

  it "is valid with valid attributes" do
    expect(valid_book).to be_valid
  end

  context 'Database' do
    it 'checks if data is present in the database' do
      expect(Book.exists?(valid_book.id)).to be true
    end

    it 'checks the number of records in the database' do
      create_list(:book, 3)
      expect(Book.count).to eq(3)
    end
  end
end
