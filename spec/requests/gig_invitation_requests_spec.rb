require "rails_helper"

describe "Gig Invitations Requests" do
  let(:root_path) { "/gig_invitations" }
  let(:gig) { FactoryBot.create(:gig) }
  let(:musician) { FactoryBot.create(:musician) }
  let(:user) { create(:user) }

  before(:each) { login_and_activate_user(user) }

  describe "PATCH #update" do
    let(:gmm) do
      FactoryBot.create(:gig_musician_membership, gig: gig, musician: musician)
    end
    it "should update the confirmation_status and confirmed_at fields" do
      orig_confirmed_at = gmm.confirmed_at
      patch root_path + gmm.id.to_s, params: { confirmation_status: "yes" }
      res = JSON.parse(response.body)
      expect(res["confirmation_status"]).to eq("yes")
      expect(res["confirmed_at"]).to_not eq(orig_confirmed_at)
    end
  end
end
