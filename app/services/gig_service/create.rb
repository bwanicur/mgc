module GigService
  class Create

    def initialize(data={})
      @gig_data = data[:gig]
      @musicians = data[:musicians] || []
    end

    def run
      Gig.transaction do
        gig = Gig.create!(@gig_data)
        gig.musicians = @musicians
        gig
      end
    end

  end
end
