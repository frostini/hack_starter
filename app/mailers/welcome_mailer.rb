class WelcomeMailer < ApplicationMailer

	def welcome_message user
		@url = 'some.domain'
		@user = user
		mail(to: @user[:email], subject: 'we received your message !')
	end
end
