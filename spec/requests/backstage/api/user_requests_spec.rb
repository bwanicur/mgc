require 'rails_helper'

describe "BACKSTAGE::API: Users Requests" do

  let(:user) { FactoryBot.create(:user) }
  let(:root_path) { "/backstage/api/users/" }

  before(:each) { login_and_activate_user(user) }
  
  describe "GET show" do
    let(:musician1) { create(:musician, user: user) }
    let(:musician2) { create(:musician, user: user) }
    let(:gig1) { create(:gig, user: user) }
    it "should return the current user's dashboard data (current gigs, etc...)" do
      gig1.musicians = [ musician1, musician2 ]
      get root_path + "/#{user.id}"
      expect(response).to have_http_status(:success)
      res = JSON.parse(response.body)
      expect(res['last_requested_at']).to be_present
      expect(res['user']['id']).to be_present
      expect(res['musicians']).to be_present
      expect(res['musicians'].count).to eq(2)
      expect(res['gigs'].first).to be_present
      expect(res['gigs'].first['musicians'].count).to eq(2)
    end
  end

  describe "PATCH update" do
    it "returns success JSON after updating a user"

    it "returns errors on fail"
  end

  describe "DELETE destroy" do
    it "returns success JSON after deleting a user"
  end


end
