module Backstage
  module API
    class GigMusicianMembershipsController < BaseController
      def update
        gmm = GigMusicianMembership.find(params[:id])
        gmm.update!(
          confirmation_status: params[:confirmation_status],
          confirmed_at: Time.zone.now
        )
        render json: hash_gmm(gmm)
      end

      private

      def hash_gmm(gmm)
        MGCSerializer::GigMusicianMembership.new(gmm).as_hash
      end
    end
  end
end
