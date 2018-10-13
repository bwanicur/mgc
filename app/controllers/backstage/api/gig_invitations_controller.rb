module Backstage
  module API
    class GigInvitationsController < BaseController
      def send_sms_invitation
        gmm = get_gmm
        res = SmsGigInvitationJob.perform_later(gmm)
        gmm.update_attribute(:sms_count, gmm.sms_count + 1) if res.present?
        render json: { success: res.present?, gmm: hash_gmm(gmm) }
      end

      def send_email_invitation
        gmm = get_gmm
        res = EmailGigInvitationJob.perform_later(gmm)
        gmm.update_attribute(:email_count, gmm.email_count + 1) if res.present?
        render json: { success: res.present?, gmm: hash_gmm(gmm) }
      end

      private

      def get_gmm
        GigMusicianMembership
          .where(id: params[:id])
          .includes([{ gig: %i[user venue] }, :musician]).first
      end

      def hash_gmm(gmm)
        MGCSerializer::GigMusicianMembership.new(gmm).as_hash
      end
    end
  end
end
