class Gig < ApplicationRecord
  validates :user_id, :venue_id, :priv_hash, :title, :start_time, presence: true
  validates :priv_hash, uniqueness: true
  belongs_to :user
  belongs_to :venue

  has_many :gig_musician_memberships, dependent: :destroy
  has_many :musicians, through: :gig_musician_memberships

  before_validation :set_priv_hash

  private

  def set_priv_hash
    if !priv_hash.present?
      self.priv_hash = SecureRandom.hex
    else
      true
    end
  end
end
