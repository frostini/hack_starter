class DwellingsController < ApplicationController
before_action :authenticate_user!, except: [:show, :index]
before_action :set_dwelling_context, except: [:index]

  def index
  end

  def show
    @program_options = @dwelling.programs.map{|p| [p.name, p.id]}
  end

  def send_inquiry
    if current_user.send_message(@dwelling, params[:body], params[:subject])
      flash[:success] = "Congrats! Your inquiry has been send to the host!"
    else
      flash[:danger] = "Sorry, something went wrong while sending your inquiry"
    end

    redirect_to dwelling_path(@dwelling)
  end

  def submit_application
    application = DwellingApplication.new(
      dwelling_id:  @dwelling.id,
      applicant_id: current_user.id,
      program_id:   params[:program_id],
      message:      params[:message]
    )

    if application.save
      flash[:success] = "Congrats! You have successfully submitted your application to the host. Good luck!"
    else
      flash[:danger] = "Sorry, something went wrong while sedning your application"
    end

    redirect_to dwelling_path(@dwelling)
  end


private

  def set_dwelling_context
    @dwelling = Dwelling.find_by_id(params[:id])
    unless @dwelling.present?
      flash[:danger] = "Sorry, dwelling could not be found"
      redirect_to dwellings_path and return
    end
  end

end