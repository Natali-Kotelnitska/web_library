require 'rails_helper'



# RSpec.describe BooksController, type: :request do

# let(:valid_attributes) { attributes_for(:book) }
# let(:invalid_attributes) { attributes_for(:book, title: '') }
# let(:new_attributes) { attributes_for(:book) }
# let(:book) { create(:book, valid_attributes) }

# describe BooksController, type: :request do

#   describe 'GET /index' do
#     it 'renders a successful response' do
#       create(:book, valid_attributes)
#       get books_url
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET /show' do
#     it 'renders a successful response' do
#       get book_url(book)
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET /new' do
#     it 'renders a successful response' do
#       get new_book_url
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET /edit' do
#     it 'renders a successful response' do
#       get edit_book_url(book)
#       expect(response).to be_successful
#     end
#   end

#   describe 'POST #create' do
#     context 'with valid parameters' do
#       it 'creates a new Book and redirects to the created book' do
#         expect do
#           post books_url, params: { book: valid_attributes }
#         end.to change(Book, :count).by(1)
#         expect(response).to redirect_to(book_url(Book.last))
#       end
#     end

#     context 'with invalid parameters' do
#       it 'does not create a new Book and renders a response with 422 status' do
#         expect do
#           post books_url, params: { book: invalid_attributes }
#         end.to change(Book, :count).by(0)
#         expect(response).to be_unprocessable
#       end
#     end
#   end



#   describe 'PATCH #update' do

#     context 'with valid parameters' do
#       it 'updates the requested book and redirects to the book' do
#         expect {
#           patch book_url(book), params: { book: new_attributes }
#           book.reload
#         }.to change(book, :title).to(new_attributes[:title])
#          .and change(book, :author).to(new_attributes[:author])

#         expect(response).to redirect_to(book_url(book))
#       end
#     end

#     context 'with invalid parameters' do
#       it 'renders a response with 422 status' do
#         patch book_url(book), params: { book: invalid_attributes }
#         expect(response).to be_unprocessable
#       end
#     end
#   end

#   describe 'DELETE #destroy' do
#     let!(:book) { create(:book, valid_attributes) }

#     it 'destroys the requested book and redirects to the books list' do
#       expect do
#         delete book_url(book)
#       end.to change(Book, :count).by(-1)

#       expect(response).to redirect_to(books_url)
#     end
#   end
# end


# end


RSpec.describe BooksController, type: :request do
  let(:valid_attributes) { attributes_for(:book) }
  let(:invalid_attributes) { attributes_for(:book, title: '') }
  let(:new_attributes) { attributes_for(:book) }
  let!(:book) { create(:book, valid_attributes) }
  let(:valid_params) { { book: valid_attributes } }
  let(:invalid_params) { { book: invalid_attributes } }

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:book, valid_attributes)
      get books_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get book_url(book)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_book_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_book_url(book)
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Book and redirects to the created book' do
        expect do
          post books_url, params: valid_params
        end.to change(Book, :count).by(1)
        expect(response).to redirect_to(book_url(Book.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Book and renders a response with 422 status' do
        expect do
          post books_url, params: invalid_params
        end.to change(Book, :count).by(0)
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested book and redirects to the book' do
        expect {
          patch book_url(book), params: { book: new_attributes }
          book.reload
        }.to change(book, :title).to(new_attributes[:title])
          .and change(book, :author).to(new_attributes[:author])

        expect(response).to redirect_to(book_url(book))
      end
    end

    context 'with invalid parameters' do
      it 'renders a response with 422 status' do
        patch book_url(book), params: invalid_params
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested book and redirects to the books list' do
      expect do
        delete book_url(book)
      end.to change(Book, :count).by(-1)

      expect(response).to redirect_to(books_url)
    end
  end
end
