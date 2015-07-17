class Reading < ActiveRecord::Base
  include ActivityHelper
  
  enum status: Settings.reads

  belongs_to :book
  belongs_to :user
  after_save :activity_read

  private
  def activity_read
    activity_create :mark_read, self.user
  end
end
