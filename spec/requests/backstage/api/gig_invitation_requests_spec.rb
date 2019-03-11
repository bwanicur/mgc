require 'rails_helper'

describe 'BACKSTAGE: Gig Invitation Requests' do
  include EmailTestHelper

  let(:user) { FactoryBot.create(:user) }
  let(:root_path) { '/backstage/api/gig_invitations' }
  let(:payment) { FactoryBot.build(:payment, amount: Money.new(10000)) }
  let(:gmm) { FactoryBot.create(:gig_musician_membership, payment: payment) }

  before(:each) { login_and_activate_user(user) }

  describe 'POST #send_sms_invitation' do
    it "should send a SMS invite" do
      post root_path + '/send_sms_invitation', params: { id: gmm.id }
      res = JSON.parse(response.body)
      expect(res['success']).to be_truthy
    end

    it "should update the sms_count on the GigMusicianMembership object" do
      expect(gmm.sms_count).to eq(0)
      post root_path + '/send_sms_invitation', params: { id: gmm.id }
      res = JSON.parse(response.body)
      expect(res['gmm']['sms_count']).to eq(1)
      expect(gmm.reload.sms_count).to eq(1)
    end
  end

  describe 'POST #send_email_invitation' do
    it "should send an email invite" do
      post root_path + '/send_email_invitation', params: { id: gmm.id }
      res = JSON.parse(response.body)
      expect(res['success']).to be_truthy
      expect(last_sent_email.subject).to match(/^MGC GIG ALERT.*/)
    end

    it "should update the email_count on the GigMusicianMembership object" do
      expect(gmm.email_count).to eq(0)
      post root_path + '/send_email_invitation', params: { id: gmm.id }
      res = JSON.parse(response.body)
      expect(res['gmm']['email_count']).to eq(1)
      expect(gmm.reload.email_count).to eq(1)
    end
  end

end
