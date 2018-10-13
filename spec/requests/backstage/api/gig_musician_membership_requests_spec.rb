require 'rails_helper'

describe 'Gig Musician Membership Requests' do

  let(:root_path) { '/backstage/api/gig_musician_memberships/' }
  let(:gig) { FactoryBot.create(:gig) }
  let(:musician) { FactoryBot.create(:musician) }

  describe 'POST #create' do
    it "should create a GigMusicianMembership record" do
      post root_path, params: { gig_id: gig.id, musician_id: musician.id }
      res = JSON.parse(response.body)
      expect(res['success']).to eq(true)
      expect(res['gig_musician_membership']['id']).to be_present
    end

    it "should return errors" do
      post root_path, params: { gig_id: gig.id, musician_id: nil }
      res = JSON.parse(response.body)
      expect(res['success']).to eq(false)
      expect(res['errors']).to be_present
    end
  end

  describe 'PATCH #update' do
    let(:gmm) do
      FactoryBot.create(:gig_musician_membership, gig: gig, musician: musician)
    end
    it "should update the confirmation_status and confirmed_at fields" do
      orig_confirmed_at = gmm.confirmed_at
      patch root_path + gmm.id.to_s, params: { confirmation_status: 'yes' }
      res = JSON.parse(response.body)
      expect(res['success']).to eq(true)
      expect(res['gig_musician_membership']['confirmation_status']).to eq('yes')
      expect(res['gig_musician_membership']['confirmed_at']).to_not eq(orig_confirmed_at)
    end
  end

  describe 'DELETE #destroy' do
    let(:gmm) do
      FactoryBot.create(:gig_musician_membership, gig: gig, musician: musician)
    end
    it "should destory a GigMusicianMembership (remove musician from gig)" do
      delete root_path + gmm.id.to_s
      res = JSON.parse(response.body)
      expect(res['success']).to eq(true)
      expect(GigMusicianMembership.find_by(id: gmm.id)).to eq(nil)
    end
  end

end
