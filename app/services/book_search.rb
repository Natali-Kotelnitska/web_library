class BookSearch
  def self.search(query)
    BooksIndex
        .query(query_string: {fields: [:title, :author], query: query})
        .order(_score: :desc)
        .records
  end
end
