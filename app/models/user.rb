class User < ApplicationRecord
  has_many :borrowings, dependent: :destroy
  has_many :books, through: :borrowings
end
