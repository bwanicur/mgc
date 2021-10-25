class Venue < ApplicationRecord
  validates :name, :address1, :city, :state, :zipcode, presence: true
  validates :state, length: { maximum: 2, minimum: 2 }

  belongs_to :user

  has_many :gigs

  after_validation :geocode, if: -> { address_has_changed? }
  geocoded_by :full_address

  ADDRESS_ATTS = [ :address1, :address2, :city, :state, :zipcode ]

  def address_has_changed?
    ADDRESS_ATTS.each do |att|
      return true if send(att.to_s + '_changed?')
    end
    false
  end

  def full_address
    ADDRESS_ATTS.map{|att| send(att)}.compact.join(' ')
  end

end
