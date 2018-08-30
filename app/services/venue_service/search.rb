module VenueService
  class SearchError < StandardError
  end
  
  class Search
    def initialize(atts={})
      @name = atts[:name]
      raise SearchError.new('Name is required') unless @name.present?
      @city = atts[:city]
      @state = atts[:state]
    end

    def run
      venues = Venue.where("name ILIKE ?", "%#{@name}%")
      venues = venues.where("city ILIKE ?", "%#{@city}%") if @city.present?
      venues = venues.where("state = ?", @state) if @state.present?
      # TODO: order by most often invited musicians
      venues
    end
  end
end
