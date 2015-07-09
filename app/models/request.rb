class Request < ActiveRecord::Base
  belongs_to :user

  scope :list_request, ->{order bought: :asc, created_at: :desc}
  scope :requesting, ->{where bought: false}
end
