module ApplicationHelper
  def book_form_url(book)
  book.new_record? ? books_path : book_path(book)
end
end
