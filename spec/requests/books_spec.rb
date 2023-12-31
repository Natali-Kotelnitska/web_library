require 'rails_helper'

RSpec.describe BooksController, type: :request do
  let(:valid_attributes) { attributes_for(:book) }
  let(:invalid_attributes) { attributes_for(:book, title: '') }
  let(:new_attributes) { attributes_for(:book) }
  let(:valid_params) { { book: valid_attributes } }
  let(:invalid_params) { { book: invalid_attributes } }
  let!(:book) { create(:book) }
   let(:user) { create(:user) }


  describe 'GET /index' do
    it 'renders index page and a successful response' do
      get books_path

      expect(response).to be_successful
      expect(CGI.unescapeHTML(response.body)).to include(book.title)
    end
  end

  describe 'GET /show' do
    it 'renders show page and a successful response' do
      sign_in user
      get book_path(book)

      expect(response).to be_successful
      expect(CGI.unescapeHTML(response.body)).to include(book.title)
    end
  end

  describe 'GET /new' do
    it 'renders new page and a successful response' do
      get new_book_path

      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders edit page and a successful response' do
      get edit_book_path(book)

      expect(response).to be_successful
      expect(CGI.unescapeHTML(response.body)).to include(book.title)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Book and redirects to the created book' do
        expect {post books_path, params: valid_params}.to change(Book, :count).by(1)

        expect(response).to be_redirect
        expect(flash[:notice]).to eq("Book was successfully created.")
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Book and renders a response with 422 status' do
        expect {post books_path, params: invalid_params}.not_to change(Book, :count)

        expect(response).to be_unprocessable
        expect(flash[:alert]).to eq("Error: Book could not be created.")
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested book and redirects to the book' do

        expect do
          patch book_path(book), params: { book: new_attributes }

          book.reload
        end.to change(book, :title).to(new_attributes[:title])
          .and change(book, :author).to(new_attributes[:author])

        expect(response).to be_redirect
        expect(flash[:notice]).to eq("Book was successfully updated.")
      end
    end

    context 'with invalid parameters' do
      it 'renders a response with 422 status' do
        patch book_path(book), params: invalid_params

        expect(response).to be_unprocessable
        expect(flash[:alert]).to eq("Error: Book could not be created.")
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested book and redirects to the books list' do
      expect {delete book_path(book)}.to change(Book, :count).by(-1)

      expect(response).to be_redirect
      expect(flash[:notice]).to eq("Book was successfully destroyed.")
    end
  end
end
