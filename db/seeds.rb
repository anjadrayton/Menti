# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seeding db'

User.create(first_name: "Anja", last_name: "Drayton", email: "anja@email.com", password: "secret")
User.create(first_name: "Aaron", last_name: "Wong", email: "aaron@email.com", password: "secret")
User.create(first_name: "Chad", last_name: "Franceschini", email: "chaddy@email.com", password: "secret")
User.create(first_name: "George", last_name: "Kettle", email: "george@email.com", password: "secret")
Mentorship.create(user_id: 2, subject: 'test subject', description: 'come be my test subject')
Mentorship.create(user_id: 3, subject: 'maths', description: 'im pretty good at maths')
MentorshipApplication.create(user_id: 1, mentorship_id: 1)
MentorshipApplication.create(user_id: 3, mentorship_id: 1)
MentorshipApplication.create(user_id: 4, mentorship_id: 2)

puts 'seeding db done'
# Aaron is Chad and Anja's mentor
# Chad is George's mentor
