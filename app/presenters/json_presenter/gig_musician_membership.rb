module JsonPresenter
  class GigMusicianMembership

    def initialize(gmm)
      @gmm = gmm
    end

    def as_hash
      {
        id: @gmm.id,
        gig_id: @gmm.gig_id,
        musician_id: @gmm.musician_id,
        confirmation_status: @gmm.confirmation_status,
        confirmed_at: @gmm.confirmed_at
      }
    end

    def as_json
      as_hash.to_json
    end
  end
end
