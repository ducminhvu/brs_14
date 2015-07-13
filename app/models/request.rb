class Request < ActiveRecord::Base
  belongs_to :user

  scope :sort_request, ->{order bought: :asc, created_at: :desc}
  scope :requesting, ->{where bought: false}
  scope :requesting_of, ->user{where user_id: user.id, bought: false}
  scope :list_request_of, ->user{where user_id: user.id}
end
