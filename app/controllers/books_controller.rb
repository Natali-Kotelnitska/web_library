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
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      flash.now[:alert] = "Error: Book could not be created."

      render :new, status: :unprocessable_entity
    end
  end

  def update
    @book = resource

    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      flash.now[:alert] = "Error: Book could not be created."

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = resource

    @book.destroy

    redirect_to books_path, notice: "Book was successfully destroyed.", status: :see_other
  end

  private

    def book_params
      params.require(:book).permit(:title, :author, :isbn, :description, :cover, :content)
    end

    def collection
      Book.ordered
    end

    def resource
      collection.find(params[:id])
    end
end
