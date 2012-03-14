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
  
  def forgotpassword(email)
  
	@user = User.find_by_email(email)
  
	@password = @user.reset_password_code
  
	mail to: email, subject: "forgotten password"
  
  end
end
