# frozen_string_literal: true

module GigService
  class SearchError < StandardError; end

  class Search
    LIMIT = 20

    def self.run(user, atts = {})
      raise(SearchError, "User is required") unless user.present?

      venue_id = atts[:venue_id]
      title = atts[:title]
      starts_at = atts[:starts_at] || (Time.zone.now - 4.hours)
      limit = atts[:limit] || LIMIT
      starts_at_opr = atts[:direction] == "forward" ? ">=" : "<="

      gigs = user
              .gigs
              .includes(%i[venue musicians])
              .where("starts_at #{starts_at_opr} ?", starts_at)
              .order(:starts_at)
              .limit(limit)
      gigs = gigs.where(venue_id: venue_id) if venue_id.present?
      gigs = gigs.where("title ILIKE ?", "%#{title}%") if title.present?

      gigs
    end
  end
end
