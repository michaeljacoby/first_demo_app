class NewletterMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newletter_mailer.weekly.subject
  #
  def weekly(email)
    

    mail to: email, subject: "boonbuddy weekly"
  end
end
