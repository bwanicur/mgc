module GigService
  class SearchError < StandardError
  end

  class Search
    LIMIT = 20

    def initialize(user, atts={})
      @user = user
      raise SearchError.new('User is required') unless @user.present?
      @venue_id = atts[:venue_id]
      @title = atts[:title]
      @start_time = atts[:start_time] || (Time.zone.now - 4.hours)
      @direction = atts[:direction] || 'forward'
      @limit = atts[:limit] || LIMIT
    end

    def run
      opr = @direction == 'forward' ? '>=' : '<='
      gigs = @user.gigs
                  .where("start_time #{opr} ?", @start_time)
                  .order(:created_at)
                  .limit(@limit)
      gigs = gigs.where(venue_id: @venue_id) if @venue_id.present?
      gigs = gigs.where("title ILIKE ?", "%#{@title}%") if @title.present?
      gigs
    end
  end
end
