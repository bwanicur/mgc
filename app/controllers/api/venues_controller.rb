module API
  class VenuesController < BaseController

    def index
      begin
        venues = VenueService::Search.new(venue_search_params).run
      rescue VenueService::SearchError => e
        render json: { msg: e.message }, status: 400
        return
      end
      render json: { venues: venues.map { |v| hv(v) } }
    end

    def show
      venue = Venue.find(params[:id])
      render json: hv(venue)
    end

    def create
      venue = Venue.create!(venue_params.merge(user: current_user))
      render json: hv(venue)
    end

    def update
      venue = Venue.find(params[:id])
      venue.update!(venue_params)
      render json: hv(venue)
    end

    def destroy
      venue = Venue.find(params[:id])
      venue.destroy!
      head :ok
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
