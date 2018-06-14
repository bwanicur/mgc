class Payment < ApplicationRecord
  validates :user_id, :gig_musician_membership_id, presence: true

  belongs_to :user
  belongs_to :gig_musician_membership

  monetize :amount_cents, as: "amount", allow_nil: true

end
