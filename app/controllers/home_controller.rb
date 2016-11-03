class HomeController < ApplicationController
layout "welcome"
# before_action :authenticate_user!

  def index
  end
  def say_hello
person = params

  	flash.now[:notice] = "Congrats! Your inquiry has been sent to the host!"
  	example = WelcomeMailer.welcome_message(person).deliver!
  	
binding.pry
  	render "index"

  end

  def newsletter_signup
person = params
example = NewsletterSignupMailer.beta_enlist(person).deliver!
flash.now[:notice] = "Thank you for signing up for our beta!"

render "index"
  end 
end
