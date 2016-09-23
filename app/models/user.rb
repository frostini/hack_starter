class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # ADMIN                 = "User::Admin"
  # PARTICIPANT           = "User::Participant"
  # HOST                  = "User::Host"
  self.inheritance_column = :user_type

scope :admins, -> { where(user_type: 'Admin') } 
scope :hosts, -> { where(user_type: 'Host') }
scope :participants, -> { where(user_type: 'Participant') } 


def self.user_types
	%w(Admin Host Participant)
end

def self.user_types_for_select
	self.user_types.map {|r| [r.humanize, r.camelcase]}
end
end
