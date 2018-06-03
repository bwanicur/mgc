class Gig < ApplicationRecord
  validates :user_id, :venue_id, :title, :start_time, presence: true

  belongs_to :user
  belongs_to :venue 

  has_many :gig_musician_memberships, dependent: :destroy
  has_many :musicians, through: :gig_musician_memberships

end
