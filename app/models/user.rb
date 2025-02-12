class User < ApplicationRecord
  has_many :borrowings, dependent: :destroy
  has_many :books, through: :borrowings

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
