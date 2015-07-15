class Reading < ActiveRecord::Base
  include ActivityHelper

  belongs_to :book
  belongs_to :user
  after_create :activity_read

  private
  def activity_read
    activity_create "#{self.user.name} has read \"#{self.book.title}\" book" if self.status == Settings.reads
  end
end
