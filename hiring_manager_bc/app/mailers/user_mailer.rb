class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.application_update.subject
  #
  def application_update
    @user = user
    mail to: user.email, subject: "Application Update"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_interview.subject
  #
  def new_interview(user)
    @user = user
    mail to: user.email, subject: "New Interview is added"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_feedback.subject
  #
  def new_feedback(user)
    @user = user
    mail to: user.email, subject: "New Feedback is added"
  end
end
