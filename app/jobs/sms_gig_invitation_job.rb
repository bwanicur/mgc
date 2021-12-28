# frozen_string_literal: true

class SmsGigInvitationJob < ApplicationJob
  queue_as :default

  def perform(gig_musician_membership)
    res = GigService::SmsInvitation.new(gig_musician_membership).run
    if res[:success]
      true
    else
      if gig_musician_membership.sms_count > 0
        gig_musician_membership.update_attribute(
          :sms_count,
          gig_musician_membership.sms_count - 1
        )
      end
      false
    end
  end

end
