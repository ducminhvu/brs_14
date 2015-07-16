class Review < ActiveRecord::Base
  include ActivityHelper

  belongs_to :book
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  after_create :activity_review

  scope :average_rated, ->book{where("book_id = ?",book.id).average("rating")}
  scope :review, ->{order created_at: :DESC}

  private
  def activity_review
    activity_create "#{self.user.name} has write a review for \"#{self.book.title}\" book"
  end
end
