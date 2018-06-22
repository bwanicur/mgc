module EmailTestHelper

  def last_sent_email
    ActionMailer::Base.deliveries.last
  end

end
