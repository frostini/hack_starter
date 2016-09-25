# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


host_1 = User.new(
                    :first_name =>"Woody",
                    :last_name => "Allen",
                    :email => "host1@gmail.com",
                    :password => "password123",
                    :user_type => "Host",
                    avatar_url: "http://mostfamousperson.net/WoodyAllen.png"
                  )
host_1.save

host_2 = Host.new(
                    :first_name =>"Christopher",
                    :last_name => "Nolan",
                    :email => "host2@gmail.com",
                    :password => "password123",
                    :user_type => "Host",
                    avatar_url: "http://media.todaybirthdays.com/thumb_x256x256/upload/2015/05/06/christopher-nolan.jpg"
                  )
host_2.save

host_3 = Host.new(
                    :first_name =>"Sophia",
                    :last_name => "Coppola",
                    :email => "host3@gmail.com",
                    :password => "password123",
                    :user_type => "Host",
                    avatar_url: "http://67.media.tumblr.com/avatar_f9b8ce9dbf6e_128.png"
                  )
host_3.save


participant_1 = User.new(
                    :first_name =>"Sancho",
										:last_name => "Pansa",
										:email => "participant1@gmail.com",
                    monthly_household_income: 2100,
                    household_member_size: 3,
                    voucher_number: "323NLASD",
										:password => "password123",
                    :user_type => "Participant",
                    avatar_url: "https://pbs.twimg.com/profile_images/2638310958/55307dc2a8dafc996e9fe81b50f146e8.jpeg"
                    )
participant_1.save


participant_2 = Participant.new(
                  :first_name =>"Avril",
                  :last_name => "Bethers",
                  monthly_household_income: 2500,
                  household_member_size: 4,
                  voucher_number: "ADR7889",
                  :email => "participant2@gmail.com",
                  :password => "password123",
                  :user_type => "Participant",
                  avatar_url: "https://ichef.bbci.co.uk/images/ic/256x256/p01bqdkf.jpg"
                )
participant_2.save

participant_3 = Participant.new(
                  :first_name =>"Blake",
                  :last_name => "Winston",
                  monthly_household_income: 3000,
                  household_member_size: 6,
                  voucher_number: "6YHC246",
                  :email => "participant3@gmail.com",
                  :password => "password123",
                  :user_type => "Participant",
                  avatar_url: "https://pbs.twimg.com/profile_images/612801569386397696/PrTJyBpz.jpg"
                )
participant_3.save


admin_1 = User.new(
                    :first_name =>"Boss",
										:last_name => "Person",
										:email => "admin@gmail.com",
										:password => "password123",
                    :user_type => "Admin"
                  )
admin_1.save
puts admin_1

Program.create(name: "Rapid Rehousing")
Program.create(name: "Month To Month")
Program.create(name: "Long Term")

dwelling_1 = Dwelling.create(
  img_url: "https://upload.wikimedia.org/wikipedia/commons/c/c0/Gingerbread_House_Essex_CT.jpg",
  host_id:        host_1.id,
  participant_id: participant_1.id,
  display_name:   "Sweet home in heart of San Jose",
  monthly_rent:   3000,
  num_rooms:      2,
  num_bathrooms:  1,
  property_type:  "condo",
  is_available:   true
)

dwelling_1.programs << Program.first(2)

Address.create(
  addressable_id: dwelling_1.id,
  addressable_type: "Dwelling",
  phone: "1231231234",
  line_1: "201 S Market St",
  city: "San Jose", state: "CA",
  zipcode: "95113"
)

dwelling_2 = Dwelling.create(
  img_url: "https://upload.wikimedia.org/wikipedia/commons/c/c0/Gingerbread_House_Essex_CT.jpg",
  host_id:        host_3.id,
  display_name:   "San Jose cozy 1 bedroom",
  monthly_rent:   2500,
  num_rooms:      1,
  num_bathrooms:  1,
  property_type:  "apartment",
  is_available:   true
)

dwelling_2.programs << Program.last(2)

Address.create(
  addressable_id: dwelling_2.id,
  addressable_type: "Dwelling",
  phone: "1231231234",
  line_1: "1628 Hostetter Rd",
  city: "San Jose", state: "CA",
  zipcode: "95131"
)

dwelling_3 = Dwelling.create(
  img_url: "https://upload.wikimedia.org/wikipedia/commons/c/c0/Gingerbread_House_Essex_CT.jpg",
  host_id:        host_2.id,
  display_name:   "Perfect size for a family in North Valley",
  monthly_rent:   3880,
  num_rooms:      3,
  num_bathrooms:  1,
  property_type:  "house",
  is_available:   true
)

Address.create(
  addressable_id: dwelling_3.id,
  addressable_type: "Dwelling",
  phone: "1231231234",
  line_1: "1696 Berryessa Rd",
  city: "San Jose", state: "CA",
  zipcode: "95133"
)

dwelling_3.programs << Program.last

dwelling_4 = Dwelling.create(
  img_url: "https://upload.wikimedia.org/wikipedia/commons/c/c0/Gingerbread_House_Essex_CT.jpg",
  host_id:        host_2.id,
  display_name:   "1 bedroom with parking near Alamo Square",
  monthly_rent:   2150,
  num_rooms:      1,
  num_bathrooms:  1,
  property_type:  "apartment",
  is_available:   true
)

Address.create(
  addressable_id: dwelling_4.id,
  addressable_type: "Dwelling",
  phone: "1231231234",
  line_1: "1350 Golden Gate Ave",
  line_2: "#10",
  city: "San Francisco", state: "CA",
  zipcode: "94115"
)

dwelling_4.programs << Program.last(2)

dwelling_5 = Dwelling.create(
  img_url: "https://upload.wikimedia.org/wikipedia/commons/c/c0/Gingerbread_House_Essex_CT.jpg",
  host_id:        host_3.id,
  display_name:   "Spacious Studio in Mission",
  monthly_rent:   3880,
  num_rooms:      0,
  num_bathrooms:  1,
  property_type:  "house",
  is_available:   true
)

Address.create(
  addressable_id: dwelling_5.id,
  addressable_type: "Dwelling",
  phone: "1231231234",
  line_1: "375 Alabama St",
  line_2: "#100",
  city: "San Francisco", state: "CA",
  zipcode: "94110"
)

dwelling_5.programs << Program.first(2)

dwelling_6 = Dwelling.create(
  img_url: "https://upload.wikimedia.org/wikipedia/commons/c/c0/Gingerbread_House_Essex_CT.jpg",
  host_id:        host_1.id,
  display_name:   "Russian Hill gem",
  monthly_rent:   3660,
  num_rooms:      2,
  num_bathrooms:  2,
  property_type:  "apartment",
  is_available:   true
)

Address.create(
  addressable_id: dwelling_6.id,
  addressable_type: "Dwelling",
  phone: "1231231234",
  line_1: "1958 Polk St",
  city: "San Francisco", state: "CA",
  zipcode: "94109"
)

dwelling_6.programs << Program.first

DwellingApplication.create(
  dwelling_id:  dwelling_1.id,
  applicant_id: participant_1.id,
  program_id:   Program.first.id,
  message:      "Hi there! I would like to live here!"
)