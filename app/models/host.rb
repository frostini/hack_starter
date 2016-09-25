class Host < User
  has_many :listings, class_name: "Dwelling", foreign_key: "host_id"


  def is_host?
    true
  end

  def is_participant?
    false
  end
end