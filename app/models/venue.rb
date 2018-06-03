class Venue < ApplicationRecord
  validates :name, :address1, :city, :state, :zipcode, presence: true

  has_many :gigs
  has_many :user_venue_votes
end
