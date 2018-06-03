class UserVenueVote < ApplicationRecord
  validates :user_id, :venue_id, presence: true
  validates :venue_id, uniqueness: { scope: :user_id }

  belongs_to :user
  belongs_to :venue
end
