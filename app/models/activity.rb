class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liker, through: :likes, source: :user
  enum action_type: Settings.action_type

  scope :sort_activities, ->{order created_at: :desc}

  def activity_out_text
    self.send self.action_type
  end

  def follow
    relationship = Relationship.find_by id: self.object_relative_id
    self.user.name + I18n.t("activity.follow") + relationship.followed.name
  end

  def mark_read
    reading = Reading.find_by id: self.object_relative_id
    self.user.name + I18n.t("activity.mark_read") + reading.book.title
  end

  def mark_favorite
    favorite = Favorite.find_by id: self.object_relative_id
    self.user.name + I18n.t("activity.mark_favorite_p1") + favorite.book.title +
      I18n.t("activity.mark_favorite_p2")
  end

  def write_review
    review = Review.find_by id: self.object_relative_id
    self.user.name + I18n.t("activity.write_review") + review.book.title
  end

  def write_comment
    comment = Comment.find_by id: self.object_relative_id
    self.user.name + I18n.t("activity.write_comment_p1") + comment.review.user.name +
      I18n.t("activity.write_comment_p2") + comment.review.book.title
  end
end
