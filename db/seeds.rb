# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count === 0
  User.create(username: "admin", email: "admin@test.com", password: "test123", password_confirmation: "test123")
  User.create(username: "tester1", email: "test1@test.com", password: "test123", password_confirmation: "test123")
  User.create(username: "tester2", email: "test2@test.com", password: "test123", password_confirmation: "test123")
end

if Link.count === 0
  Link.create(title: "Buy 1 Get 1 Free", link_address: "https://google.com", user_id: 2)
  Link.create(title: "Invite your friends", link_address: "https://github.com", user_id: 2)
  Link.create(title: "Twitter", link_address: "https://twitter.com", user_id: 2)
  Link.create(title: "Instagram", link_address: "https://instagram.com", user_id: 3)
end

# for i in 2..3 do
#   user = User.where(user_id: i)
#   user.link_id = i
#   user.save
# end