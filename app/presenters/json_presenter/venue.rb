module JsonPresenter
  class Venue

    def initialize(venue)
      @venue = venue
    end

    def atts
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
      atts.to_json
    end
  end
end
