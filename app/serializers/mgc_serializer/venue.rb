module MGCSerializer
  class Venue
    def initialize(venue)
      @venue = venue
    end

    def as_hash
      @venue.slice(
        :id,
        :name,
        :address,
        :city,
        :state,
        :zipcode,
        :latitude,
        :longitude,
        :timezone,
        :phone,
        :email,
        :website
      )
    end
  end
end
