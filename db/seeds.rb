region = Region.create!(
  name: "Southern California",
  code: "socal"
)

user1 = User.create!(
  url_name: "seed-1-user",
  region: region,
  email: "test@test.com",
  first_name: "Seed",
  last_name: "User 1",
  password: "testing123",
  password_confirmation: "testing123"
)
user1.activate!
pianist = Musician.create!(
  email: "pollypiano@test.com",
  user: user1,
  full_name: "Polly Pianst",
  instrument: "piano",
  phone: "111-111-1111"
)
user1.musicians << pianist
drummer = Musician.create!(
  email: "donnydrums@test.com",
  user: user1,
  full_name: "Donny DaJewler",
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
gig1.musicians = [pianist, drummer]
gig2 = Gig.create!(
  region: region,
  user: user1,
  venue: venue1,
  title: "Duo Gig",
  start_time: Time.zone.now + 1.week + 1.day
)
gig2.musicians = [pianist]
