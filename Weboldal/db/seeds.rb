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

dir = Rails.root.join('public', 'data')
Image.create path: File.join(dir, "1"), mime: "image/jpeg", user_id: User.find_by(email: "admin@gmail.com").id
Image.create path: File.join(dir, "2"), mime: "image/jpeg", user_id: User.find_by(email: "admin@gmail.com").id
Image.create path: File.join(dir, "3"), mime: "image/jpeg", user_id: User.find_by(email: "test@gmail.com").id