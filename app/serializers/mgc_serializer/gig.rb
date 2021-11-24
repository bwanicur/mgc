module MGCSerializer
  class Gig
    def initialize(gig)
      @gig = gig
    end

    def as_hash
      {
        id: @gig.id,
        title: @gig.title,
        start_time: @gig.start_time,
        end_time: @gig.end_time,
        venue: MGCSerializer::Venue.new(@gig.venue).as_hash,
        musicians: @gig.musicians.map { |m| MGCSerializer::Musician.new(m).as_hash }
      }
    end
  end
end
