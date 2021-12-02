# require 'rails_helper'

# describe GigService::SmsInvitation do

#   after { described_class.client = Twilio::REST::Client }

#   let(:gmm) do
#     FactoryBot.create(:gig_musician_membership, {
#       musician: FactoryBot.create(:musician, phone: ENV['TEST_RECEIVE_NUMBER']),
#       payment: FactoryBot.build(:payment, amount: Money.new(10000))
#     })
#   end

#   describe '#run' do
#     before { described_class.client = TestSmsHelper::MockTwilioSms }

#     it "should send a SMS message to a musician" do
#       res = described_class.new(gmm).run
#       expect(res[:success]).to eq(true)
#       expect(res[:tw_message].body).to match(/MGC GIG ALERT:/)
#     end

#     it "should return a SMS message that includes a confirmation link" do
#       res = described_class.new(gmm).run
#       expect(res[:tw_message].body).to match(/\/gig_invitations\/.+/)
#     end

#     it "should return an error" do
#       described_class.client = Twilio::REST::Client
#       invalid_num = '111-111-1111'
#       gmm = FactoryBot.create(:gig_musician_membership, {
#         musician: FactoryBot.create(:musician, phone: invalid_num),
#         payment: FactoryBot.build(:payment, amount: Money.new(10000))
#       })
#       res = described_class.new(gmm).run
#       expect(res[:success]).to eq(false)
#       expect(res[:error]).to be_present
#     end
#   end

# end
