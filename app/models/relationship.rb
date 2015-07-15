class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  after_create :activity_follow
  after_destroy :activity_unfollow

  private
  def activity_follow
    Activity.create! action: "#{self.follower.name} has followed #{self.followed.name}", user_id: self.follower_id
  end

  def activity_unfollow
    Activity.create! action: "#{self.follower.name} has unfollowed #{self.followed.name}", user_id: self.follower_id
  end
end
