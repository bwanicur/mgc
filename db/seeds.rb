region = Region.create!(
  name: "Southern California",
  code: "socal"
)

user1 = User.create!(
  region: region,
  email: "test@test.com",
  first_name: "Test",
  last_name: "User",
  password: "testing123",
  password_confirmation: "testing123"
)
user1.activate!
user1_self_musician = Musician.create!(
  user_id: user1.id,
  first_name: "Test",
  last_name: "User - Musician",
  email: "test@test.com",
  phone: "111-111-1111",
  instrument: "bass"
)
pianist = Musician.create!(
  email: "pollypiano@test.com",
  user: user1,
  first_name: "Polly Piano",
  last_name: "Player",
  instrument: "piano",
  phone: "111-111-1111"
)
user1.musicians << pianist
drummer = Musician.create!(
  email: "donnydrums@test.com",
  user: user1,
  first_name: "Donny",
  last_name: "Drummer",
  instrument: "drums",
  phone: "111-111-1111"
)
user1.musicians << drummer
venue1 = Venue.create!(
  user: user1,
  name: "Jazz Club",
  address1: "111 Broadway",
  city: "San Diego",
  state: "CA",
  zipcode: "92101"
)
gig1 = Gig.create!(
  region: region,
  user: user1,
  venue: venue1,
  title: "Trio Gig",
  start_time: Time.zone.now + 1.week
)
gig1.musicians = [user1_self_musician, pianist, drummer]
gig2 = Gig.create!(
  region: region,
  user: user1,
  venue: venue1,
  title: "Duo Gig",
  start_time: Time.zone.now + 1.week + 1.day
)
gig2.musicians = [user1_self_musician, pianist]
