# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



host_1 = Host.new(
                    :first_name =>"Woddy",
                    :last_name => "Allen",
                    :email => "host@gmail.com",
                    :password => "password123")
host_1.save
puts host_1


participant_1 = Participant.new(
                    :first_name =>"Sancho",
										:last_name => "Pansa",
										:email => "participant@gmail.com",
										:password => "password123")
participant_1.save
puts participant_1


admin_1 = Admin.new(:first_name =>"Boss",
										:last_name => "Person",
										:email => "admin@gmail.com",
										:password => "password123")
admin_1.save
puts admin_1

Program.create(name: "Rapid Rehousing")
Program.create(name: "Month To Month")
Program.create(name: "Long Term")

dwelling_1 = Dwelling.create(
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
  addressable_id: 1,
  addressable_type: "Dwelling",
  phone: "1231231234",
  line_1: "201 S Market St",
  city: "San Jose", state: "CA",
  zipcode: "95113"
  # latitude: 37.331436,
  # longitude: -121.890214
)

DwellingApplication.create(
  dwelling_id:  dwelling_1.id,
  applicant_id: participant_1.id,
  program_id:   Program.first.id,
  message:      "Hi there! I would like to live here!"
)