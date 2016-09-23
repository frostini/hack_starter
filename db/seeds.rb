# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



host_1 = Host.new(	:first_name =>"Woddy",:last_name => "Allen",:public_user_id => "host_1234",:email => "host@gmail.com",:password => "password123")
host_1.save
puts host_1


participant_1 = Participant.new(	:first_name =>"Sancho",
										:last_name => "Pansa",
										:public_user_id => "participant_1234",
										:email => "participant@gmail.com",
										:password => "password123")
participant_1.save
puts participant_1


admin_1 = Admin.new(	:first_name =>"Boss",
										:last_name => "Person",
										:public_user_id => "admin_1234",
										:email => "admin@gmail.com",
										:password => "password123")
admin_1.save
puts admin_1