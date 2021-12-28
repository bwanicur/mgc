# frozen_string_literal: true

module API
  class UsersController < BaseController
    def show
    end

    def edit
    end

    def update
    end

    private

    def user_params
      params.require(:user).permit(
        :avatar,
        :email,
        :first_name,
        :last_name,
        :address1,
        :address2,
        :city,
        :state,
        :zipcode
      )
    end
  end
end
