class WelcomeEmailJob < ApplicationJob
  retry_on StandardError

  def perform(user)
    UserMailer.welcome_email(user).deliver_now
  end
end