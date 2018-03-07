class UserMailer < ApplicationMailer
  def confirm_form(user_id, property)
    @user = User.find(user_id)  # Instance variable => available in view
    @property = property
    mail(to: @user.email, subject: 'Welcome to Le Wagon')
  end
end
