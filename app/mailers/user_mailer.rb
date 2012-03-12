class UserMailer < ActionMailer::Base
default :from => "michaelkjacoby@gmail.com"

	def welcome_email(user)

		@user = user
		@url = "boonbuddy.heroku.com"
		mail(:to => @user.email, :subject => "Welcome to boonbuddy!")
	
	end


end
