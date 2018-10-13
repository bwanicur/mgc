module Backstage
  module API
    class UsersController < BaseController
      def show
        data = {}
        data[:user] = MGCSerializer::User.new(current_user).as_hash
        data[:gigs] = current_user.upcoming_gigs.map { |g| MGCSerializer::Gig.new(g).as_hash }
        data[:musicians] = current_user.musicians.map { |m| MGCSerializer::Musician.new(m).as_hash }
        render json: data
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
end
