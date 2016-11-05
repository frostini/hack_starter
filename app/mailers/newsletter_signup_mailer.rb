class NewsletterSignupMailer < ApplicationMailer

  def beta_enlist user
    @url = 'some.domain'
    @user = user
    mail(to: @user[:email], subject: 'thanks for your interest in publicbnb')
  end
end
