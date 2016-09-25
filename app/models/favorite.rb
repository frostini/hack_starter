class Favorite < ActiveRecord::Base
  belongs_to :dwelling, class_name: 'Dwelling', foreign_key: 'dwelling_id'
  belongs_to :participant, class_name: 'User', foreign_key: "participant_id"
end
