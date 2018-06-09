module GigService
  class Create

    def initialize(data={})
      @gig_data = data[:gig]
      @musicians = data[:musicians] || []
    end

    def run
      gig = false
      Gig.transaction do
        gig = Gig.create(@gig_data)
        gig.musicians = @musicians
        raise ActiveRecord::Rollback if gig.errors.count > 0
      end
      gig
    end

  end
end
