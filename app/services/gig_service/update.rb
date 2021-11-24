module GigService
  class Update

    def self.run!(gig, gig_data)
      Gig.transaction do
        new_musicians_data = gig_data.delete("musician_data") || []
        gig.update!(gig_data)
        AddMusicians.run!(gig, new_musicians_data)
        gig
      end
    end
  end
end
