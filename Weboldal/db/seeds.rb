# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create name: "Admin", email: "admin@gmail.com", password: 'admin', password_confirmation: 'admin'
User.create name: "Test", email: "test@gmail.com", password: 'test', password_confirmation: 'test'
User.create name: "Valaki", email: "valaki@mail.bme.hu", password: 'valaki', password_confirmation: 'valaki'
users = User.all

dir = Rails.root.join('public', 'data')
Image.create path: File.join(dir, "1"), mime: "image/jpeg", user_id: users[0].id
Image.create path: File.join(dir, "2"), mime: "image/jpeg", user_id: users[0].id
Image.create path: File.join(dir, "3"), mime: "image/jpeg", user_id: users[1].id
images = Image.all

Favourite.create user_id: users[0].id, image_id: images[0].id
Favourite.create user_id: users[0].id, image_id: images[2].id
Favourite.create user_id: users[1].id, image_id: images[0].id

Comment.create content: "Teszt komment", user_id: users[0].id, image_id: images[0].id
Comment.create content: "Teszt komment", user_id: users[1].id, image_id: images[0].id
Comment.create content: "Teszt komment", user_id: users[2].id, image_id: images[0].id
Comment.create content: "Gyönyörű kép", user_id: users[0].id, image_id: images[2].id
Comment.create content: "ASD", user_id: users[2].id, image_id: images[2].id

Tag.create name: "Yoda", image_id: images[0].id
Tag.create name: "Yoda", image_id: images[2].id
Tag.create name: "kutya", image_id: images[1].id