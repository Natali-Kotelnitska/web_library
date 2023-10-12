class Book < ApplicationRecord
  validates :title, :author, :description, presence: true
  validates_length_of :title, minimum: 2, message: "Title isn't long enough"
  validates :description, length: { minimum: 2, maximum: 500 }
end
