module Backstage
  module API
    class GigsController < BaseController
      include PersonParams

      def index
        gigs = GigService::Search.run(current_user, gig_search_params)
        render json: { gigs: gigs.map { |g| hg(g) } }
      end

      def show
        gig = Gig.find(params[:id])
        render json: hg(gig)
      end

      def create
        gig = GigService::Create.run!(gig_params.merge(user: current_user))
        render json: hg(gig)
      end

      def update
        gig = Gig.find(params[:id])
        gig = GigService::Update.run!(gig, gig_params)
        render json: hg(gig)
      end

      def destroy
        gig = Gig.find(params[:id])
        gig.destroy!
        head :ok
      end

      private

      def hg(gig)
        MGCSerializer::Gig.new(gig).as_hash
      end

      def gig_search_params
        params.permit(:venue_id, :title, :start_time, :direction, :limit)
      end

      def gig_params
        params.require(:gig).permit(
          :region_id,
          :venue_id,
          :title,
          :start_time,
          :end_time,
          :short_description,
          :description,
          :musician_text,
          musicians_data: []
        )
      end
    end
  end
end
