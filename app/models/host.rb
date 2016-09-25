class Host < User
  has_many :listings, class_name: "Dwelling", foreign_key: "host_id"
end