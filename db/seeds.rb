user1 = User.create!(
  email: 'test@test.com',
  first_name: 'Test',
  last_name: 'User',
  password: 'testing123',
  password_confirmation: 'testing123'
)
user1.activate!

Musician.create(
  user_id: user1.id,
  linked_user_id: user1.id,
  first_name: 'Test',
  last_name: 'User - Musician',
  email: 'test@test.com',
  phone: '111-111-1111'
)
