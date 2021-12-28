# frozen_string_literal: true

module GigService
  class Create
    def self.run!(gig_data)
      Gig.transaction do
        musicians_data = gig_data.delete("musicians_data") || []
        gig = Gig.create!(gig_data)
        gig.venue.increment_gig_count!
        AddOrUpdateMusicians.run!(gig, musicians_data)

        gig
      end
    end
  end
end
