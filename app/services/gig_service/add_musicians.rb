module GigService
  class AddMusicians
    def self.run!(gig, musicians_data = [])
      existing_musician_ids = gig.musician_ids
      new_musician_ids = musicians_data.map { |m| m["id"] }

      musicians_data.each do |data|
        gmm = gig.gig_musician_memberships.find_or_initialize_by(
          musician_id: data["id"]
        )
        gmm.payment_amount_cents = data["payment_amount"].try(:to_money)
        gmm.musician_message = data["musician_message"]
        gmm.save!
        (new_musician_ids - existing_musician_ids).each do |musician_id|
          # TODO: send invite (new musician added to gig)
        end
      end
    end
  end
end
