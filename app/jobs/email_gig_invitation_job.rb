require 'net/smtp'
class EmailGigInvitationJob < ApplicationJob

  SMTP_ERRORS = [
    IOError,
    Net::SMTPAuthenticationError,
    Net::SMTPServerBusy,
    Net::SMTPUnknownError,
    Net::SMTPFatalError,
    Net::SMTPSyntaxError,
    TimeoutError,
  ]

  def perform(gig_musician_membership)
    begin
      GigInvitationMailer.invite_email(gig_musician_membership).deliver
    rescue *SMTP_ERRORS
      if gig_musician_membership.email_count > 0
        gig_musician_membership.update_attribute(
          :email_count,
          gig_musician_membership.email_count - 1
        )
      end
    end
  end

end
