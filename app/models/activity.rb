class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liker, through: :likes, source: :user
end
