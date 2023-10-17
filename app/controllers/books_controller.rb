class BooksController < ApplicationController

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path, notice: "Book was successfully destroyed",
    # head :no_content # HTTP 204 No Content ???
    status: :see_other # HTTP 303 See Other (with redirection)
  end

  private

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :isbn, :description)
    end
end
