class SosMailer < ActionMailer::Base
  default from: "sos.cloudapp@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://sos-app.cloudapp.net/'
    mail(to: @user.email, subject: 'Bem vindo ao SOS Cloud App')
  end

  def os_email(service_order, message)
    @service_order = service_order
    mail(to: @service_order.user.email, subject: "Ordem de Servico #{@service_order.id} #{message} em #{Time.now.strftime("%d/%m/%Y %H:%M")}.")
  end
end