# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
School.create(name: 'Vidyamandir Vidyalaya', registration_number: 1)
School.create(name: 'Bal Mandir Vidyalaya', registration_number: 2)

['Admin', 'Teacher', 'Principal', 'Clerk'].each do |roll_name|
  Role.create(name: roll_name)
end
User.create(name: 'Anjali Sharma', role: Role.find_by(name: 'Admin'))
User.create(name: 'Rahul Jadhav', role: Role.find_by(name: 'Principal'))
User.create(name: 'Raj Yadav', role: Role.find_by(name: 'Clerk'))

p 'Seed completed!'
