class GigMusicianMembership < ApplicationRecord
  validates :gig_id, :musician_id, presence: true
  validates :gig_id, uniqueness: { scope: :musician_id }

  belongs_to :gig
  belongs_to :musician

  has_one :payment

  enum confirmation_status: { pending: 0, confirmed: 1, declined: 2 }
  # TODO: auto generate confirmation_token on create
end
