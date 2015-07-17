class Favorite < ActiveRecord::Base
  include ActivityHelper

  belongs_to :user
  belongs_to :book
  after_create :activity_favorite
  after_destroy :activity_unfavorite

  private
  def activity_favorite
    activity_create :mark_favorite, self.user
  end

  def activity_unfavorite
    activity_create :mark_unfavorite, self.user
  end
end
