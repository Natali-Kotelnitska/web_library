require "rails_helper"

RSpec.describe BooksController, type: :request do
  let!(:book) { create :book }

  before(:each) do
    BooksIndex.reset
  end

  describe "GET #search" do
    context "when query is present and matches books" do
      before do
        get search_books_path, params: { search: { query: book.title } }
      end

      it "returns a successful response" do
        expect(response).to be_successful
      end

      it "returns the matching books in the response body" do
        expect(response.body).to include(CGI.escapeHTML(book.title))
      end

      it "sets a flash notice with the number of books found" do
        expect(flash[:notice]).to eq("The #{Book.count} books with '#{book.title}' query found.")
      end
    end

    context "when query is blank" do
      before do
        get search_books_path, params: { search: { query: "" } }
      end

      it "returns a redirect response" do
        expect(response).to be_redirect
      end

      it "sets a flash alert with a warning message" do
        expect(flash[:alert]).to eq("Search field cannot be empty. Please try again.")
      end
    end

    context "when query does not match any books" do
      before do
        get search_books_path, params: { search: { query: "BadQuery" } }
      end

      it "returns a successful response" do
        expect(response).to be_successful
      end

      it "does not return unmatched books in the response body" do
        expect(response.body).not_to include(CGI.escapeHTML("BadQuery"))
      end

      it "sets a flash alert indicating no matching books" do
        expect(flash[:alert]).to eq("No such book available.")
      end
    end
  end
end
