class DwellingApplication < ActiveRecord::Base
  belongs_to  :applicant, class_name: "User", foreign_key: "applicant_id"
  belongs_to  :dwelling
  belongs_to  :program

  scope :approved, -> { where(is_approved: true) }

end