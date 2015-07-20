class UserMailerSend
  include Sidekiq::Worker

  def perform user_id
    @user = User.find user_id
    UserMailer.notification(@user).deliver
  end
end
