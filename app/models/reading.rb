class Reading < ActiveRecord::Base
  include ActivityHelper
  
  enum status: Settings.reads

  belongs_to :book
  belongs_to :user
  after_create :activity_read
  after_destroy :activity_unread

  private
  def activity_read
    activity_create :mark_read, self.user
  end

  def activity_unread
    activity_destroy "mark_read"
  end
end
