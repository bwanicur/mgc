require 'rails_helper'

describe "BACKSTAGE: Musicians Requests" do

  let(:root_path) { "/backstage/api/musicians" }
  let(:user) { FactoryBot.create(:user) }
  let(:instrument) { FactoryBot.create(:instrument) }

  before(:each) { login_and_activate_user(user) }

  describe "GET index" do
    it "returns a collection of a user's musicians" do
      FactoryBot.create(:musician, user: user)
      get root_path
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)
      expect(hash['musicians']).to be
      expect(hash['musicians'].size).to eq(1)
    end
  end

  describe "GET show" do
    let(:musician) { FactoryBot.create(:musician) }
    it "returns JSON for a musician" do
      get "#{root_path}/#{musician.id}"
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)['musician']
      expect(hash['id']).to eq(musician.id)
    end
  end

  describe "POST create" do
    it "returns success JSON after creating a musician" do
      atts = { musician: FactoryBot.attributes_for(:musician).merge(instrument_id: instrument.id) }
      post root_path, params: atts
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)
      expect(hash['success']).to eq(true)
      expect(hash['musician']['id']).to be_present
    end

    it "returns errors on fail" do
      atts = { musician: FactoryBot.attributes_for(:musician) }
      post root_path, params: atts
      hash = JSON.parse(response.body)
      expect(hash['success']).to eq(false)
      expect(hash['errors']).to be_present
    end
  end

  describe "PATCH update" do
    let(:musician) { FactoryBot.create(:musician) }
    it "returns success JSON after updating a musician" do
      patch "#{root_path}/#{musician.id}", params: { musician: { email: 'newemail@test.com' } }
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)
      expect(hash['success']).to eq(true)
      expect(hash['musician']['email']).to eq('newemail@test.com')
      expect(hash['musician']['id']).to eq(musician.id)
    end

    it "returns errors on fail" do
      patch "#{root_path}/#{musician.id}", params: { musician: { email: nil } }
      hash = JSON.parse(response.body)['errors']
      expect(hash).to be
      expect(hash.keys.first).to eq('email')
    end
  end

  describe "DELETE destroy" do
    let(:musician) { FactoryBot.create(:musician, user: user) }
    it "returns success JSON after deleting a musician" do
      delete "#{root_path}/#{musician.id}"
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)
      expect(hash['success']).to eq(true)
      expect(user.musicians.count).to eq(0)
    end
  end


end
