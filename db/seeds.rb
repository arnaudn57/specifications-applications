# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Create Company
puts "Creating Company"
Company.create(name: "CKEL")

#Create User Admin
puts "Creating User Admin"
User.create(email: "arnaud.nicastro@gmail.com", username:"Arnaud Nicastro", password: "123456", password_confirmation: "123456", company_id: 1)
