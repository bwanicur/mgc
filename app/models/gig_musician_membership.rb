class GigMusicianMembership < ApplicationRecord
  validates :gig_id, :musician_id, :confirmation_token, presence: true
  validates :gig_id, uniqueness: { scope: :musician_id }

  enum confirmation_status: { pending: 0, yes: 1, no: 2 }

  belongs_to :gig
  belongs_to :musician
  belongs_to :alt_instrument,
    class_name: "Instrument",
    foreign_key: :alt_instrument_id,
    optional: true

  has_one :payment

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
