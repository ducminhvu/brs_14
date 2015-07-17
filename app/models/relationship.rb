class Relationship < ActiveRecord::Base
  include ActivityHelper

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  after_create :activity_follow
  after_destroy :activity_unfollow

  private
  def activity_follow
    activity_create :follow, self.follower
  end

  def activity_unfollow
    activity_create :unfollow, self.follower
  end
end
