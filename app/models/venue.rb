class Venue < ApplicationRecord
  include GigCountable

  validates :name, :address, :city, :state, :zipcode, presence: true
  validates :state, length: { maximum: 2, minimum: 2 }

  belongs_to :user

  has_many :gigs

  # TODO
  # geocoded_by :full_address
  # after_validation :assign_geocode_atts, if: -> { address_has_changed? }

  ADDRESS_ATTS = %i[address city state zipcode].freeze

  private

  def address_has_changed?
    ADDRESS_ATTS.each { |att| return true if send("#{att}_changed?") }

    false
  end

  def full_address
    ADDRESS_ATTS.map { |att| send(att) }.compact.join(" ")
  end

  def assign_geocode_atts
    geocode
    return unless latitude && longitude

    self.timezone = Timezone.lookup(latitude, longitude) # TODO: call some .to_s method here ?
  end
end
