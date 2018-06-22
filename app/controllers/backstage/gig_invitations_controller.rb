module Backstage
  class GigInvitationsController < BaseController

    def send_sms_invitation
    end

    def send_email_invitation
      gmm = get_gmm
      res = GigInvitationMailer.invite_email(gmm).deliver_later
      gmm.update_attribute(:email_count, gmm.email_count + 1) if res
      render json: { success: res, gmm: hash_gmm(gmm) }
    end

    private

    def get_gmm
      GigMusicianMembership.where(id: params[:id])
        .includes([{gig: [:user, :venue]}, :musician]).first
    end

    def hash_gmm(gmm)
      JsonPresenter::GigMusicianMembership.new(gmm).as_hash
    end

  end
end
