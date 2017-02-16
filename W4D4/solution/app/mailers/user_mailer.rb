class UserMailer < ApplicationMailer
  default from: 'Andrew <andrew@99cats.com>'

  def welcome_email(user)
    @user = user
    @url = "localhost:3000/session/new"
    mail(to: 'user.email', subject: 'Welcome')
  end

end
