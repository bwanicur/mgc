module UserService
  class Create
    def initialize(data)
      @data = data
    end

    def run(instrument_id = nil)
      user = false
      User.transaction do
        user = User.create!(@data)
        if instrument_id
          # TODO: UserService::CreateLinkedMusician
        end
        linked_musician = Musician.new # temp
        # TODO: Extract this into a separate service.  Do not want this by default.
        # linked_musician = Musician.create(
        #   user: user,
        #   linked_user_id: user.id,
        #   instrument_id: instrument_id,
        #   email: user.email,
        #   first_name: user.first_name,
        #   last_name: user.last_name,
        #   address1: user.address1,
        #   address2: user.address2,
        #   city: user.city,
        #   state: user.state,
        #   zipcode: user.zipcode,
        #   phone: user.phone
        # )
      end
      user
    end

  end
end
