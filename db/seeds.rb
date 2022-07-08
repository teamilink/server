# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Link.count === 0
  Link.create(title: "Buy 1 Get 1 Free", link_address: "https://google.com")
  Link.create(title: "Invite your friends", link_address: "https://github.com")
  Link.create(title: "Twitter", link_address: "https://twitter.com")
end