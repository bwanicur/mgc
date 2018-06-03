class User < ApplicationRecord
  authenticates_with_sorcery!
  
  has_many :musicians
  has_many :gigs

end
