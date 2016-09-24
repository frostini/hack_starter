class Dwelling < ActiveRecord::Base
  belongs_to  :user
  has_and_belongs_to_many :programs
  has_one     :address, :dependent => :destroy, :as => :addressable

  scope :available, -> { where(is_available: false) }

end
