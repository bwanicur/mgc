class Musician < ApplicationRecord
  include GigCountable

  validates :user_id, :email, :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :user_id, uniqueness: { scope: :email }

  belongs_to :user

  has_many :gig_musician_memberships, dependent: :destroy
  has_many :gigs, through: :gig_musician_memberships
end
