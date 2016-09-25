class Dwelling < ActiveRecord::Base
  belongs_to  :host, class_name: "User", foreign_key: "host_id"
  belongs_to  :participant, class_name: "User", foreign_key: "participant_id"
  has_and_belongs_to_many :programs
  has_many :dwelling_applications
  has_one     :address, :dependent => :destroy, :as => :addressable

  scope :available, -> { where(is_available: true) }

end