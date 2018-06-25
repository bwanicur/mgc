module UserService
  class Create

    def initialize(data)
      @data = data
    end

    def run(instrument_id)
      user = false
      User.transaction do
        user = User.create(@data)
        linked_musician = Musician.create(
          user: user,
          linked_to_self_user_id: user.id,
          instrument_id: instrument_id,
          email: user.email,
          first_name: user.first_name,
          last_name: user.last_name,
          address1: user.address1,
          address2: user.address2,
          city: user.city,
          state: user.state,
          zipcode: user.zipcode,
          phone: user.phone
        )
        raise ActiveRecord::Rollback if failed?(user, linked_musician)
      end
      user
    end

    private

    def failed?(user, musician)
      user.errors.count > 0 || musician.errors.count > 0
    end

  end
end
