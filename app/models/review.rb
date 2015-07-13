class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :average_rated, ->book{where("book_id = ?",book.id).average("rating")}
end
