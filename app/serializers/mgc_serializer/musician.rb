module MGCSerializer
  class Musician
    def initialize(musician)
      @musician = musician
    end

    def as_hash
      @musician.slice(
        :id,
        :email,
        :full_name,
        :address1,
        :address2,
        :city,
        :state,
        :zipcode,
        :phone,
        :num_gigs
      )
    end
  end
end
