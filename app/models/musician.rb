class Musician < ApplicationRecord
  validates :user_id, :email, :phone, presence: true
  validates :user_id, uniqueness: { scope: :email }
  validates :phone, length: { is: 10 }

  belongs_to :user
  belongs_to :instrument

  belongs_to :linked_self_user, class_name: "User", foreign_key: :linked_to_self_user_id, optional: true

  # each User can be represented by a Musician object belonging to another user.
  # this will support a networking feature should we decide to implement it.
  belongs_to :linked_user, class_name: "User", foreign_key: :linked_to_user_id, optional: true

  has_many :gig_musician_memberships, dependent: :destroy
  has_many :gigs, through: :gig_musician_memberships

  before_validation :digits_only_for_phone

  private

  def digits_only_for_phone
    phone.gsub!(/[^\d]/, '')
  end

end
