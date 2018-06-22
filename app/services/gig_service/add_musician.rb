module GigService

  class AddMusician
    def initialize(atts={})
      @gig_id = atts[:gig_id]
      @musician_id = atts[:musician_id]
      @user_id = atts[:user_id]
      @payment_amount_cents = atts[:payment_amount_cents]
    end

    def run
      gmm = nil
      ActiveRecord::Base.transaction do
        gmm = GigMusicianMembership.create({
          gig_id: @gig_id,
          musician_id: @musician_id
        })
        gmm.create_payment(amount: Money.new(@payment_amount_cents))
        raise ActiveRecord::Rollback if needs_rollback?(gmm)
      end
      gmm
    end

    private

    def has_required_data?
      @gig_id.present? && @musician_id.present?
    end

    def needs_rollback?(gmm)
      gmm.errors.count > 0 || gmm.payment.errors.count > 0
    end

  end
end
