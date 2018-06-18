module JsonPresenter
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
        venue: JsonPresenter::Venue.new(@gig.venue).as_hash,
        musicians: @gig.musicians.map{ |m| JsonPresenter::Musician.new(m).as_hash }
      }
    end

    def as_json
      as_hash.to_json
    end
  end
end
