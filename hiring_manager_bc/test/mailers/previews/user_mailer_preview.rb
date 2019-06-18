# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/application_update
  def application_update
    UserMailer.application_update
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_interview
  def new_interview
    UserMailer.new_interview
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_feedback
  def new_feedback
    UserMailer.new_feedback
  end

end
