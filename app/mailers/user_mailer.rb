class UserMailer < ApplicationMailer
  def notification user
    @user = user
    mail to: user.email, subject: t("email.subject")
  end
end
