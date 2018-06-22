class GigInvitationMailer < ApplicationMailer
    include NameHelper
    include DateHelper
    include Rails.application.routes.url_helpers

    # for the view templates
    helper :name
    helper :date
    helper :address

    default from: 'do-not-reply@mygigcalendar.com'

    def invite_email(gig_musician_membership)
      @gmm = gig_musician_membership
      @gig = @gmm.gig
      @user = @gig.user
      @venue = @gig.venue
      @musician = @gmm.musician
      @gmm_link = gig_invitation_url(@gmm.confirmation_token)
      sub_str = "MGC GIG ALERT: #{last_name_init(@user)} on #{date_time_abbrev(@gig.start_time)}"
      mail(to: @musician.email, subject: sub_str)
    end

end
