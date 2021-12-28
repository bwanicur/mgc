# frozen_string_literal: true

class Venue < ApplicationRecord
  include GigCountable

  validates :name, :address, :city, :state, :zipcode, presence: true
  validates :state, length: { maximum: 2, minimum: 2 }
  validates :name, :address, uniqueness: { scope: :user }

  belongs_to :user

  has_many :gigs

  # TODO
  # geocoded_by :full_address
  # after_validation :geocode, if: -> { address_has_changed? }

  ADDRESS_ATTS = %i[address city state zipcode].freeze

  def full_address
    ADDRESS_ATTS.map { |att| send(att) }.compact.join(" ")
  end

  def address_has_changed?
    ADDRESS_ATTS.each { |att| return true if send("#{att}_changed?") }

    false
  end
end
