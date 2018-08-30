module MGCSerializer
  class Venue
    def initialize(venue)
      @venue = venue
    end

    def as_hash
      {
        id: @venue.id,
        name: @venue.name,
        latitude: @venue.latitude,
        longitude: @venue.longitude,
        address1: @venue.address1,
        address2: @venue.address2,
        city: @venue.city,
        state: @venue.state,
        zipcode: @venue.zipcode,
        phone: @venue.phone,
        email: @venue.email,
        website: @venue.website
      }
    end

    def as_json
      as_hash.to_json
    end
  end
end
