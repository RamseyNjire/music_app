# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



ramsey = User.create(username: "Ramsey", email: "ramsey@example.com", password: "password")
gideon = User.create(username: "Gideon", email: "gideon@example.com", password: "password")
reson = User.create(username: "Reson", email: "reson@example.com", password: "password")
brian = User.create(username: "Brian", email: "brian@example.com", password: "password")
sophie = User.create(username: "Sophie", email: "sophie@example.com", password: "password")


neighborhood = Band.create(name: "Neighborhood")
sauti_sol = Band.create(name: "Sauti Sol")