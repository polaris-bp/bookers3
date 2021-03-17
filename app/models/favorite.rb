class Favorite < ApplicationRecord
  MAX_BOOKS_COUNT = 1
  belongs_to :user
  belongs_to :book
  validates_uniqueness_of :book_id, scope: :user_id

end
