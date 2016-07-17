# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  Employee.create!(:name => "Jon",:manager_id => 1,:phone => "9000000001",:email => "jon@snow.com")
  Employee.create!(:name => "Robb",:manager_id => 1,:phone => "9000000002",:email => "robb@snow.com")
  Employee.create!(:name => "Bran",:manager_id => 1,:phone => "9000000003",:email => "bran@snow.com")
  Employee.create!(:name => "Ghost",:manager_id => 2,:phone => "9000000004",:email => "ghost@snow.com")
  Employee.create!(:name => "Sam",:manager_id => 2,:phone => "9000000005",:email => "sam@snow.com")
  Employee.create!(:name => "Grey Wind",:manager_id => 3,:phone => "9000000006",:email => "gwind@snow.com")
  Employee.create!(:name => "Summer",:manager_id => 4,:phone => "9000000007",:email => "summer@snow.com")

