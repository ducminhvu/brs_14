class Review < ActiveRecord::Base
  include ActivityHelper

  belongs_to :book
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user

  after_create :activity_review
  after_destroy :activity_delete_review

  scope :average_rated, ->book{where("book_id = ?",book.id).average("rating")}
  scope :review, ->{order created_at: :DESC}

  private
  def activity_review
    activity_create :write_review, self.user
  end

  def activity_delete_review
    activity_destroy "write_review"
  end
end
