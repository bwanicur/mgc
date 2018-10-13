module MGCSerializer
  class Person
    def initialize(person)
      @person = person
    end

    def as_hash
      {
        id: @person.id,
        email: @person.email,
        first_name: @person.first_name,
        last_name: @person.last_name,
        address1: @person.address1,
        address2: @person.address2,
        city: @person.city,
        state: @person.state,
        zipcode: @person.zipcode,
        phone: @person.phone,
      }
    end

    def as_json
      as_hash.to_json
    end
  end
end
