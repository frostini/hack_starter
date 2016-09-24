class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # after_action	:store_action


  # def store_action
  #   return unless request.get? 
  #   if (request.path != "/users/sign_in" &&
  #       request.path != "/users/sign_up" &&
  #       request.path != "/users/password/new" &&
  #       request.path != "/users/password/edit" &&
  #       request.path != "/users/confirmation" &&
  #       request.path != "/users/sign_out" &&
  #       !request.xhr?) # don't store ajax calls
  #     store_location_for(:user, user_path(:user))
  #   end
  # end

protected
	  def after_sign_in_path_for(resource)
      view_context.sti_users_path(resource.user_type, resource)
		end
  
    def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) << :user_type
	  end
end
