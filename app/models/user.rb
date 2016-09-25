class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # for mailerboxer gem to allow messaging between users
  acts_as_messageable

  # ADMIN                 = "User::Admin"
  # PARTICIPANT           = "User::Participant"
  # HOST                  = "User::Host"
  self.inheritance_column = :user_type

  has_many :dwellings
  has_one :address, :as => :addressable


  scope :admins, -> { where(user_type: 'Admin') }
  scope :hosts, -> { where(user_type: 'Host') }
  scope :participants, -> { where(user_type: 'Participant') }


  def self.user_types
  	%w(Admin Host Participant)
  end

  def self.user_types_for_select
  	self.user_types.map {|r| [r.humanize, r.camelcase]}
  end

  def name
    first_name.capitalize + ' ' + last_name.capitalize
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return email
    #if false
    #return nil
  end
end
