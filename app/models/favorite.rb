class Favorite < ActiveRecord::Base
  include ActivityHelper

  belongs_to :user
  belongs_to :book
  after_create :activity_favorite
  after_destroy :activity_unfavorite

  private
  def activity_favorite
    activity_create "#{self.user.name} added #{self.book.title} to his favorite books"
  end

  def activity_unfavorite
    activity_destroy "#{self.user.name} remoted #{self.book.title} from his favorite books"
  end
end
