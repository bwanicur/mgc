require "rails_helper"

describe Gig do
  let(:user) { create(:user) }
  let(:venue) { create(:venue, user: user) }

  describe "before_validation" do
    let(:gig) do
      build(:gig, date: Date.today, start_time: "7:30 pm", user: user, venue: venue)
    end

    # start_time is 7:30 pm
    def expected_dt(gig)
      DateTime.new(
        gig.date.year,
        gig.date.month,
        gig.date.day,
        19,
        30
      )
    end

    it "sets the starts_at by using the date value and parsing the start_time value" do
      gig.save!
      expect(gig.starts_at).to eq(expected_dt(gig))
    end

    it "throws an exception for an un-parseable time string" do
      gig.start_time = "I like carrots"
      expect { gig.save! }.to raise_exception(ArgumentError)
    end

    it "sets the reminder_at if the user provided a hours_before_reminder value" do
      adjusted_dt = expected_dt(gig) - 5.hours
      gig.hours_before_reminder = 5
      gig.save!
      expect(gig.reminder_at).to eq(adjusted_dt)
    end

    it "does not set the reminder_at if there is no hours_before_reminder value" do
      gig.save!
      expect(gig.reminder_at).to be_nil
    end
  end
end
