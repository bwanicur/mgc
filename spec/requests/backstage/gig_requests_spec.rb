require 'rails_helper'

describe "BACKSTAGE: Gig Requests" do

  let(:root_path) { "/backstage/gigs" }
  let(:user) { FactoryBot.create(:user) }
  let(:venue) { FactoryBot.create(:venue) }
  let(:gig) { FactoryBot.create(:gig, user: user, venue: venue) }

  before(:each) { login_and_activate_user(user) }

  describe "GET index" do
    it "returns JSON for a collection of a user's gigs" do
      user.gigs << FactoryBot.create(:gig)
      user.gigs << FactoryBot.create(:gig)
      get root_path
      expect(response).to have_http_status(:success)
      res =  JSON.parse(response.body)['gigs']
      expect(res.class).to eq(Array)
      expect(res.size).to eq(2)
    end
  end

  describe "GET show" do
    before(:each) do
      @g1 = FactoryBot.create(:gig)
      @m1 = FactoryBot.create(:musician, user: @g1.user)
      @g1.musicians << @m1
    end

    it "returns JSON for a single gig object" do
      get "#{root_path}/#{@g1.id}"
      hash = JSON.parse(response.body)
      expect(hash['gig']['id']).to eq(@g1.id)
      expect(hash['gig']['musicians'].first['id']).to eq(@m1.id)
    end
  end

  describe "POST create" do
    it "returns success JSON for a successful create" do
      gig_atts = FactoryBot.attributes_for(:gig).merge(venue_id: venue.id)
      post root_path, params: { gig: gig_atts }
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)
      expect(hash['success']).to eq(true)
      expect(hash['gig']['id']).to be_present
    end
  end

  describe "PATCH update" do
    it "returns success JSON after updating a gig" do
      patch "#{root_path}/#{gig.id}", params: { gig: { title: 'new title' } }
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)['gig']
      expect(hash['title']).to eq('new title')
    end
  end

  describe "DELETE destroy" do
    it "returns success JSON after deleting a gig" do
      delete "#{root_path}/#{gig.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['success']).to eq(true)
    end
  end


end
