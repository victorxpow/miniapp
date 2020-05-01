# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([
    { email: 'joao@email.com', password: '123456' },
    { email: 'maria@email.com', password: '123456' }
])

List.create(name: "Brooklyn 99", user_id: 1)