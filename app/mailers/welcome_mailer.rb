class WelcomeMailer < ApplicationMailer

	def welcome_message user
		@url = 'some.domain'
		@user = user
		mail(to: @user[:email], subject: 'Hello World from PublicBnb')
	end
end
