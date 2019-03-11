module GigService
  class SmsInvitation
    include Rails.application.routes.url_helpers
    include MoneyRails::ActionViewExtension
    include PhoneHelper
    include NameHelper
    include DateHelper
    include AddressHelper

    cattr_accessor :client
    @@client = Twilio::REST::Client

    def initialize(gig_musician_membership)
      @gmm = gig_musician_membership
      @musician = @gmm.musician
      @gig = @gmm.gig
    end

    def run
      begin
        tw_message = @@client.new.messages.create({
          from: Rails.application.secrets.twilio_phone_number,
          to: phone_with_country_code(@musician.phone),
          body: message_body
        })
      rescue Twilio::REST::TwilioError => e
        return { success: false, error: e.message }
      end
      { success: true, tw_message: tw_message }
    end

    private

    def message_body
      <<~STR
        MGC GIG ALERT:
        #{full_name(@gig.user)} has a gig for you!
        Date: #{date_time_full(@gig.start_time)} to #{time_only(@gig.end_time)}
        Address: #{full_address(@gig.venue)}
        Pay: #{humanized_money_with_symbol(@gmm.payment.amount)}
        -----------------------
        PLEASE CONFIRM: #{gig_invitation_url(@gmm.confirmation_token)}
      STR
    end

  end
end
