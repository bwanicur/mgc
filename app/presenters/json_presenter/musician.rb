module JsonPresenter
  class Musician

    def initialize(musician)
      @musician = musician
    end

    def atts 
      {
				id: @musician.id,
        email: @musician.email,
        first_name: @musician.first_name,
        last_name: @musician.last_name,
        address1: @musician.address1,
        address2: @musician.address2,
        city: @musician.city,
        state: @musician.state,
        zipcode: @musician.zipcode,
        phone1: @musician.phone1,
        phone2: @musician.phone2,
        instrument: @musician.instrument.name
      }
    end

    def as_json
      atts.to_json
    end

  end
end
