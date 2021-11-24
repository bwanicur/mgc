module MGCSerializer
  class GigMusicianMembership
    def initialize(gmm)
      @gmm = gmm
    end

    def as_hash
      @gmm.slice(
        :id,
        :gig_id,
        :musician_id,
        :confirmation_status,
        :confirmed_at,
        :email_count
      )
    end
  end
end
