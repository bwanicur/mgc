class Venue < ApplicationRecord
  validates :name, :address1, :city, :state, :zipcode, presence: true
  validates :state, length: { maximum: 2, minimum: 2 }

  has_many :gigs
  has_many :user_venue_votes
end
