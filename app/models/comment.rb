class Comment < ActiveRecord::Base
  include ActivityHelper

  belongs_to :review
  belongs_to :user
  after_create :activity_comment#, :send_notification
  after_destroy :activity_delete_comment

  scope :comment, ->{order created_at: :DESC}

  private
  def activity_comment
    activity_create :write_comment, self.user
  end

  def activity_delete_comment
    activity_destroy "write_comment"
  end

  def send_notification
    self.review.user.send_notification_email
    self.review.comment_users.uniq.each do |user|
      user.send_notification_email
    end
  end
end
