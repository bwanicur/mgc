class Region < ApplicationRecord
  validates :code, :name, presence: true

  has_many :users
  has_many :gigs
end
