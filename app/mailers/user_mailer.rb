class UserMailer < ActionMailer::Base
  default from: "James Jones <whoever@Betastore.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @name = user.email.split("@").first
    @name = @name.titleize
    @name = "James James".titleize

    mail to: user.email
  end
end
