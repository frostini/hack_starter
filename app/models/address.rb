class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true

  scope :dwellings, -> { where(addressable_type: 'Dwelling') }
  scope :hosts, -> { where(addressable_type: 'Host') }
  scope :participants, -> { where(addressable_type: 'Participant') }

	geocoded_by :full_street_address
	after_validation :geocode 

  def full_street_address
  	if line_1.present? && zipcode.present? || city.present?
  		return line_1 + ', ' + city + ', ' + state + ', ' + zipcode 
  	else
  		nil
  	end
  end


end
