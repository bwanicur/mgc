module MGCSerializer
  class Person
    def initialize(person)
      @person = person
    end

    def as_hash
      @person.slice(
        :id,
        :email,
        :first_name,
        :last_name,
        :address1,
        :address1,
        :city,
        :state,
        :zipcode,
        :phone
      )
    end
  end
end
