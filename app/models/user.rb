class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :url_name, presence: true
  # TODO: validate format --> xxxx-xxx-xxx...
  # validates :url_name, format: { with: /\A[a-z0-9]+(\-[a-z0-9])+\Z/i }

  belongs_to :region

  # has_one_attached :avatar
  has_many :musicians
  has_many :gigs
end
