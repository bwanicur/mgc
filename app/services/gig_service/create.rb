module GigService
  class Create
    def self.run!(gig_data)
      # TOOD: gig_data will probably include something like hours_before_gig_reminder
      #       this needs to be translated into a datetime value and stored
      #       example:  5 hours before gig starts --> translate to datetime

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
