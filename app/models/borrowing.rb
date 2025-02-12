class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true
  validate :book_must_be_available, on: :create

  before_create :set_due_date

  private

  def set_due_date
    self.due_date ||= 2.weeks.from_now.to_date
  end

  def book_must_be_available
    errors.add(:book, "is already borrowed") if book.borrowed?
  end
end
