class Payment < ApplicationRecord
  validates :gig_musician_membership_id, presence: true

  belongs_to :gig_musician_membership

  monetize :amount_cents,
    allow_nil: true,
    numericality: { greater_than_or_equal_to: 0 }

end
