require "rails_helper"

RSpec.describe BookSearch do
  let!(:book1) { create :book, title: 'The Catcher in the Rye' }
  let!(:book2) { create :book, title: 'The Lord of the Rings: Part I', author: 'J.R.R. Tolkien'  }
  let!(:book3) { create :book, title: 'The Lord of the Rings: Part II', author: 'J.R.R. Tolkien' }
  let(:search_result) { BookSearch.search(query) }

  before(:each) do
    BooksIndex.reset
  end

  describe ".search" do
    context "when there are matches by title" do
      let(:query) { 'Catcher' }

      it "returns the book that matches the query" do
        expect(search_result).to contain_exactly(book1)
      end
    end

    context "when there are matches by author" do
      let(:query) { 'Tolkien' }

      it "returns the books that match the query" do
        expect(search_result).to contain_exactly(book2, book3)
      end

      it "returns the number of matches" do
        expect(search_result.count).to eq(2)
      end
    end

    context "when there are no matches" do
      let(:query) { 'Chewy' }

      it "returns an empty array" do
        expect(search_result).to be_empty
      end
    end
  end
end
