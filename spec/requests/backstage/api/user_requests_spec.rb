require 'rails_helper'

describe "BACKSTAGE: Users Requests" do

  let(:root_path) { "/backstage/api/users" }
  let(:user) { FactoryBot.create(:user) }

  before(:each) { login_and_activate_user(user) }

  describe "GET show" do
  end


  describe "PATCH update" do
    it "returns success JSON after updating a user" do
    end

    it "returns errors on fail" do
    end
  end

  describe "DELETE destroy" do
    it "returns success JSON after deleting a user" do
    end
  end


end
