class UserMailer < ActionMailer::Base
  default from: "sos.cloudapp@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://ubuntu-web.cloudapp.net/login'
    mail(to: @user.email, subject: 'Bem vindo ao SOS Cloud App')
  end
end