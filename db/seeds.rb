# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(
  email: 'test@test.com',
  first_name: 'Test',
  last_name: 'User',
  password: 'testing123',
  password_confirmation: 'testing123'
)

Musician.create(
  user_id: user1.id,
  linked_user_id: user1.id,
  first_name: 'Test',
  last_name: 'User - Musician',
  email: 'test@test.com',
  phone: '111-111-1111'
)
