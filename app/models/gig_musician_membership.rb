class GigMusicianMembership < ApplicationRecord
  validates :gig_id, :musician_id, presence: true
  validates :gig_id, uniqueness: { scope: :musician_id }

  enum confirmation_status: { pending: 0, yes: 1, no: 2 }

  belongs_to :gig
  belongs_to :musician

  has_one :payment

  before_create :set_confirmation_token

  private

  def set_confirmation_token
    self.confirmation_token = SecureRandom.hex
  end

end
