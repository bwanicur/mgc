require 'rails_helper'

describe 'BACKSTAGE: Venue Requests' do

  let(:root_path) { '/backstage/venues' }
  let(:user) { FactoryBot.create(:user) }

  before(:each) { login_and_activate_user(user) }

  describe 'GET index' do
    it "returns JSON for a collection of venues" do
      FactoryBot.create(:venue)
      FactoryBot.create(:venue)
      get root_path, params: { name: :test }
      hash = JSON.parse(response.body)
      expect(hash['venues'].count).to eq(2)
    end
  end

  describe 'GET show' do
    it "returns JSON for a single venue" do
      venue = FactoryBot.create(:venue)
      get "#{root_path}/#{venue.id}"
      hash = JSON.parse(response.body)
      expect(hash['venue']['id']).to eq(venue.id)
    end
  end

  describe 'POST create' do
    it "returns success JSON after creating a venue" do
      post root_path, params: { venue: FactoryBot.attributes_for(:venue) }
      hash = JSON.parse(response.body)
      expect(hash['success']).to eq(true)
      expect(hash['venue']['id']).to be_present
    end
  end

  describe 'PATCH update' do
    it "returns success JSON after updating a venue" do
      venue = FactoryBot.create(:venue)
      patch "#{root_path}/#{venue.id}", params: { venue: { name: 'new name' } }
      hash = JSON.parse(response.body)
      expect(hash['success']).to eq(true)
      expect(hash['venue']['name']).to eq('new name')
    end
  end

  describe 'DELETE #destroy' do
    it "returns success JSON after deleting a venue" do
      venue = FactoryBot.create(:venue)
      delete "#{root_path}/#{venue.id}"
      expect(JSON.parse(response.body)['success']).to eq(true)
    end

  end


end
