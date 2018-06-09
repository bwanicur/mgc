class User < ApplicationRecord
  authenticates_with_sorcery!
  
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  has_many :musicians
  has_many :gigs
  
  # every User is associated with a Musician object on creation.  
  # the User might need a Musician object for gig listsings.
  has_one :self_linked_musician, class_name: "Musician", foreign_key: :linked_to_self_user_id

end
