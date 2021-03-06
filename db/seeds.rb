# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(email: "admin@text.com", password: "123456789",  first_name: "Dinko", last_name: "Azema", birthday: (DateTime.now - 32.years), role:0, terms: true, phone: "+56975231235")
u2 = User.create(email: "user@text.com", password: "123456789",  first_name: "Dinko", last_name: "Azema", birthday: (DateTime.now - 32.years), role:0, terms: true, phone: "+56975231235")
c = Category.create(name: "Una categoría")

c2 = Category.create(name: "Segunda categoría")

service = Service.create( description: "Una descripción", region: "CO", comuna: "Coquimbo", user_id: u.id)

service.categories << c
service.categories << c2
