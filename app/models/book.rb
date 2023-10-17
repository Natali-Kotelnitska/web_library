class Book < ApplicationRecord
  validates :title, :author, presence: true, length: { minimum: 1, maximum: 60 }
  validates :description, presence: true, length: { minimum: 2, maximum: 500 }
end
