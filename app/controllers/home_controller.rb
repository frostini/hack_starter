class HomeController < ApplicationController
layout "welcome"
# before_action :authenticate_user!

  def index
  end
  def say_hello
    example = WelcomeMailer.welcome_message(home_params).deliver!
    flash[:notice] = "Thank you for reaching out, looking forward to getting in touch !"
    # binding.pry
  	redirect_to root_path
  end

  def newsletter_signup
    example = NewsletterSignupMailer.beta_enlist(home_params).deliver!
    flash[:notice] = "You will be granted special access. Keep an eye out for an email from us !"
    # binding.pry
    redirect_to root_path
  end 

private 
  def home_params 
    params.require(:ff).permit(:first_name, :last_name, :email, :message)
  end 
end
