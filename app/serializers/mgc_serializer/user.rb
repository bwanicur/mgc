module MGCSerializer
  class User
    # include Rails.application.routes.url_helpers

    def initialize(user)
      @user = user
    end

    # def as_hash
    #   hash = MGCSerializer::Person.new(@user).as_hash
    #   hash.merge(avatar_path: @user.avatar.attached? ? url_for(@user.avatar) : '')
    # end

    def as_hash
      @user.slice(
        :id,
        :email,
        :first_name,
        :last_name,
        :address1,
        :address2,
        :city,
        :state,
        :zipcode,
        :phone
      )
    end
  end
end
