module Backstage
  module API
    class VenuesController < BaseController

      def index
        begin
          venues = VenueService::Search.new(venue_search_params).run
        rescue VenueService::SearchError => e
          render json: { sucess: false, errors: e.message }
          return
        end
        render json: { success: true, venues: venues.map{|v| hv(v)} }
      end

      def show
        venue = Venue.find(params[:id])
        render json: { venue: hv(venue) }
      end

      def create
        venue = Venue.new(venue_params)
        if venue.save
          render json: { success: true, venue: hv(venue) }
        else
          render json: { success: false, errors: venue.errors }
        end
      end

      def update
        venue = Venue.find(params[:id])
        if venue.update_attributes(venue_params)
          render json: { success: true, venue: hv(venue) }
        else
          render json: { success: false, errors: venue.errors }
        end
      end

      def destroy
        venue = Venue.find(params[:id])
        success = venue.destroy ? true : false
        render json: { success: success }
      end

      private

      def hv(venue)
        MGCSerializer::Venue.new(venue).as_hash
      end

      def venue_search_params
        params.permit(:name, :city, :state)
      end

      def venue_params
        params.require(:venue).permit(
          :id,
          :name,
          :address1,
          :address2,
          :city,
          :state,
          :zipcode,
          :phone,
          :email,
          :website
        )
      end

    end
  end
end
