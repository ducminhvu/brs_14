class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :trackable, :validatable
   
  has_many :readings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :following, through: :active_relationships, source: :followed

  validates :password, presence: true, allow_nil: true
end
