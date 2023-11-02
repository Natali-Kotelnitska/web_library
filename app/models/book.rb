class Book < ApplicationRecord
  validates :title, :author, presence: true, length: { minimum: 1, maximum: 60 }
  validates :description, length: { maximum: 500 }
  validates :isbn, presence: true, uniqueness: true, format: { with: /\A\d[\d-]*\d\z/ }
  scope :ordered, -> { order(:title) }
end
