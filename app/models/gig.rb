class Gig < ApplicationRecord
  validates :user_id, :venue_id, :priv_hash, :title, :start_time, presence: true

  belongs_to :user
  belongs_to :region
  belongs_to :venue

  has_many :gig_musician_memberships, dependent: :destroy
  has_many :musicians, through: :gig_musician_memberships

  before_validation :set_priv_hash, on: :create
  before_save :touch_users_gigs_last_updated_at

  scope :upcoming, -> { where("start_time >= ?", Time.zone.now - 4.hours) }

  private

  def set_priv_hash
    self.priv_hash = SecureRandom.hex
  end

  def touch_users_gigs_last_updated_at
    user.update!(gigs_last_updated_at: Time.zone.now)
  end
end
