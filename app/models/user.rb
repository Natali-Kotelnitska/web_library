class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :encrypted_password, :username, presence: true
  validates :username, length: { minimum: 4, maximum: 20 },
                       format: { with: /\A[a-zA-Z0-9_.]+\z/,
                       message: "can only contain letters, numbers, and underscores" }
end
