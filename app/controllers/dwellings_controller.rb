class DwellingsController < ApplicationController
before_action :authenticate_user!, except: [:show, :index]
before_action :set_dwelling_context, except: [:index]

  def index

    search_lat_long = Geocoder.coordinates(params[:address])
    close_addresses = Address.includes(:addressable).near(search_lat_long, params[:distance]).where(addressable_type: "Dwelling")
    @dwellings = close_addresses.select {|a|  a.addressable.num_rooms >= params[:bedrooms].to_i && a.addressable.num_bathrooms >= params[:bathrooms].to_i  }

    all_listings = []
    @dwellings.each do |l|
      listing = []
      listing << l.as_json
      listing << l.addressable.as_json
      all_listings << listing
    end
    gon.mapData = all_listings
  end

  def show
    @program_options = @dwelling.programs.map{|p| [p.name, p.id]}
    @is_favorited = Favorite.where(dwelling_id: @dwelling.id, participant_id: current_user.id).present?
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

  def favorite
    if !current_user.is_participant?
      flash[:danger] = "Please create or log in to your participant account first!"
    else
      fav = Favorite.new(
        dwelling_id:    @dwelling.id,
        participant_id: current_user.id
      )

      if fav.save
        flash[:success] = "Added to your favorites!"
      else
        flash[:danger] = "Hmm, something went wrong while processing your request"
      end
    end

    redirect_to dwelling_path(@dwelling)
  end

  def unfavorite
    fav = Favorite.where(dwelling_id: @dwelling.id, participant_id: current_user.id).first

    if fav.present? && fav.destroy
      flash[:success] = "Removed from your favorites!"
    else
      flash[:danger] = "Hmm, something went wrong while processing your request"
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