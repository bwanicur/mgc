# frozen_string_literal: true

require "rails_helper"

describe "API: Musicians Requests" do
  let(:root_path) { "/api/musicians" }
  let(:user) { FactoryBot.create(:user) }

  before(:each) { login_and_activate_user(user) }

  describe "GET index" do
    it "returns a collection of a user's musicians" do
      FactoryBot.create(:musician, user: user)
      get root_path
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)
      expect(hash["musicians"]).to be
      expect(hash["musicians"].size).to eq(1)
    end
  end

  describe "GET show" do
    let(:musician) { FactoryBot.create(:musician) }
    it "returns JSON for a musician" do
      get "#{root_path}/#{musician.id}"
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)
      expect(hash["id"]).to eq(musician.id)
    end
  end

  describe "POST create" do
    it "returns success JSON after creating a musician" do
      atts = { musician: FactoryBot.attributes_for(:musician) }
      post root_path, params: atts
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)
      expect(hash["id"]).to be_present
    end

    it "returns errors on fail" do
      atts = { musician: FactoryBot.attributes_for(:musician).merge(email: nil) }
      post root_path, params: atts
      hash = JSON.parse(response.body)
      expect(response.status).to eq(400)
      expect(hash["msg"]).to match(/^Validation failed/)
    end
  end

  describe "PATCH update" do
    let(:musician) { FactoryBot.create(:musician) }
    it "returns success JSON after updating a musician" do
      patch "#{root_path}/#{musician.id}", params: { musician: { email: "newemail@test.com" } }
      expect(response).to have_http_status(:success)
      hash = JSON.parse(response.body)
      expect(hash["email"]).to eq("newemail@test.com")
      expect(hash["id"]).to eq(musician.id)
    end

    it "returns errors on fail" do
      patch "#{root_path}/#{musician.id}", params: { musician: { email: nil } }
      hash = JSON.parse(response.body)
      expect(response.status).to eq(400)
      expect(hash["msg"]).to match(/^Validation failed/)
    end
  end

  describe "DELETE destroy" do
    let(:musician) { FactoryBot.create(:musician, user: user) }
    it "returns success JSON after deleting a musician" do
      delete "#{root_path}/#{musician.id}"
      expect(response).to have_http_status(:success)
    end
  end

end
