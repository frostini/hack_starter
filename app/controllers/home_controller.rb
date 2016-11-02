class HomeController < ApplicationController
layout "welcome"
# before_action :authenticate_user!

  def index
  end
  def say_hello
binding.pry
  	flash.now[:notice] = "Congrats! Your inquiry has been sent to the host!"
  	render "index"

  end
end
