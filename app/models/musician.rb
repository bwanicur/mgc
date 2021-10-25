class Musician < ApplicationRecord
  validates :user_id, :email, presence: true
  validates :user_id, uniqueness: { scope: :email }

  belongs_to :user

  has_many :gig_musician_memberships, dependent: :destroy
  has_many :gigs, through: :gig_musician_memberships
end
