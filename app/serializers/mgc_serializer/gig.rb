module MGCSerializer
  class Gig
    def initialize(gig)
      @gig = gig
    end

    def as_hash
      @gig.slice(
        :id,
        :title,
        :date,
        :start_time,
        :end_time,
        :musicians,
        :description
      )
    end
  end
end
