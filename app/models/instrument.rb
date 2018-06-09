class Instrument < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :musicians
end
