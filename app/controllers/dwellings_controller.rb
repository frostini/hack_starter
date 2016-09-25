class DwellingsController < ApplicationController
before_action :authenticate_user!, except: [:show, :index]
before_action :set_dwelling_context, except: [:index]
before_action :verify_user_type, only: [:send_inquiry, :new_application, :submit_application]

  def index
  end

  def show
  end

  def send_inquiry
    binding.pry
  end

  def new_application
  end

  def submit_application
  end


private

  def set_dwelling_context
    @dwelling = Dwelling.find_by_id(params[:id])
    unless @dwelling.present?
      flash[:danger] = "Sorry, dwelling could not be found"
      redirect_to dwellings_path and return
    end
  end

  def user_params
    params.require(user_type.underscore.to_sym).permit(:first_name, :last_name, :public_user_id, :password, :email)
  end

end