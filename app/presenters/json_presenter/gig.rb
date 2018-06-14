module JsonPresenter
  class Gig

    def initialize(gig)
      @gig = gig
    end
    def atts
      {
        id: @gig.id,
        title: @gig.title,
        start_time: @gig.start_time,
        end_time: @gig.end_time,
        venue: JsonPresenter::Venue.new(@gig.venue).atts,
        musicians: @gig.musicians.map{ |m| JsonPresenter::Musician.new(m).atts }
      }
    end

    def as_json
      atts.to_json
    end
  end
end
