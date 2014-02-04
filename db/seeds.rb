# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = \
[
 { name: "Mike Davis", email: "mike@exampmle.com",
   password: "mike123456", password_confirmation: "mike123456" }
]
users.each {|u| User.create!(u) }
