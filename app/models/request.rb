class Request < ActiveRecord::Base
  belongs_to :user

  validates :book_name, presence: true
  validates :author, presence: true

  scope :sort_request, ->{order bought: :asc, created_at: :desc}
  scope :requesting, ->{where bought: false}
  scope :requesting_of, ->user{where user_id: user.id, bought: false}
  scope :list_request_of, ->user{where user_id: user.id}
  scope :request_accepted_oneweekago, ->{where "bought = \"t\" AND updated_at < ?", Settings.week_back.week.ago}

  after_save :send_mail_request
  private
  def send_mail_request
    UserMailerSend.perform_async self.user_id 
  end
end
