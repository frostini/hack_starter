class NewsletterSignupMailer < ApplicationMailer

  def beta_enlist user
    @url = 'some.domain'
    @user = user
    mail(to: @user[:email], subject: 'Hello World from PublicBnb')
  end
end
