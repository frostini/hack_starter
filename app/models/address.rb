class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true

  scope :dwellings, -> { where(addressable_type: 'Dwelling') }
  scope :hosts, -> { where(addressable_type: 'Host') }
  scope :participants, -> { where(addressable_type: 'Participant') }
end
