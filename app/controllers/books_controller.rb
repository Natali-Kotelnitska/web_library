class BooksController < ApplicationController

  def index
    @books = collection
  end

  def show
    @book = resource
  end

  def new
    @book = Book.new
  end

  def edit
    @book = resource
  end

  def create
    @book = collection.new(book_params)

    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book)
    else
      flash[:error] = "Error: Book could not be created."
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @book = resource

    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      flash[:error] = "Error: Book could not be created."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = resource
    @book.destroy

    flash[:notice] = "Book was successfully destroyed"
    redirect_to books_path,
    status: :see_other
  end

  private

    def book_params
      params.require(:book).permit(:title, :author, :isbn, :description)
    end

    def collection
      Book.ordered
    end

    def resource
      collection.find(params[:id])
    end
end
