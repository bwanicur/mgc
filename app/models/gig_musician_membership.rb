class GigMusicianMembership < ApplicationRecord
  validates :gig_id, :musician_id, :confirmation_token, presence: true
  validates :gig_id, uniqueness: { scope: :musician_id }

  monetize :payment_amount_cents, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  enum confirmation_status: { pending: 0, yes: 1, no: 2 }

  belongs_to :gig
  belongs_to :musician

  before_validation :set_confirmation_token

  private

  def set_confirmation_token
    if !confirmation_token.present?
      self.confirmation_token = SecureRandom.hex
    else
      true
    end
  end
end
