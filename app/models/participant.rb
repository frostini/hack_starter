class Participant < User
  has_one :home, class_name: "Dwelling", foreign_key: "participant_id"
  has_many :dwelling_applications, class_name: 'DwellingApplication', foreign_key: "applicant_id"
  has_many :favorites, class_name: 'Favorite', foreign_key: 'participant_id'
  has_many :favorite_dwellings, through: :favorites, source: :dwelling
end