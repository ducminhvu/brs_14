class Comment < ActiveRecord::Base
  include ActivityHelper

  belongs_to :review
  belongs_to :user
  after_create :activity_comment

  private
  def activity_comment
    activity_create "#{self.user.name} has commented on \"#{self.review.content}\" for \"#{self.review.book.title}\" book"
  end
end
