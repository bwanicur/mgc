module MGCSerializer
  class Venue
    def initialize(venue)
      @venue = venue
    end

    def as_hash
      @venue.slice(
        :id,
        :name,
        :latitude,
        :longitude,
        :address1,
        :address2,
        :city,
        :state,
        :zipcode,
        :phone,
        :email,
        :website
      )
    end
  end
end
