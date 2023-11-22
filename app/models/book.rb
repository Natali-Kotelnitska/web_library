class Book < ApplicationRecord
  has_one_attached :cover, dependent: :destroy
  has_one_attached :content, dependent: :destroy

  validates :title, :author, presence: true, length: { minimum: 1, maximum: 60 }
  validates :description, length: { maximum: 500 }
  validates :isbn, presence: true, uniqueness: true, format: { with: /\A\d[\d-]*\d\z/ }

  scope :ordered, -> { order(:title) }
end
