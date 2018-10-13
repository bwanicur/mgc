module MGCSerializer
  class User
    def initialize(user)
      @user = user
    end

    def as_hash
      MGCSerializer::Person.new(@user).as_hash
    end

    def as_json
      as_hash.to_json
    end
  end
end
