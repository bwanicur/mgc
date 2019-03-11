module GigService
  class AddMusician
    def initialize(atts = {})
      @gig_id = atts[:gig_id]
      @musician_id = atts[:musician_id]
      @payment_amount_cents = atts[:payment_amount_cents]
    end

    def run
      gmm = nil
      ActiveRecord::Base.transaction do
        gmm = GigMusicianMembership.create!(
          gig_id: @gig_id,
          musician_id: @musician_id
        )
        gmm.create_payment!(amount: Money.new(@payment_amount_cents))
      end
      gmm
    end

  end
end
