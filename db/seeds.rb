# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or find_or_created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create(name: 'Luke', movie: movies.first)
school = School.find_or_create_by(name: 'Vidyamandir Vidyalaya', registration_number: 1)
School.find_or_create_by(name: 'Bal Mandir Vidyalaya', registration_number: 2)

ROLES = ['Admin', 'Teacher', 'Principal', 'Clerk']

ROLES.each do |role_name|
  role = Role.find_or_create_by(name: role_name)
  user = User.find_or_initialize_by(name: role_name, role: role, mobile_number: rand(10 ** 10), school: school, email: "#{role_name}@joshsoftware.com")
  user.password = '123456'
  user.save!
end

p 'Seed completed!'
