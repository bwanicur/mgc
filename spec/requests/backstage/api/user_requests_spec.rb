require "rails_helper"

describe "BACKSTAGE::API: Users Requests" do
  let(:user) { FactoryBot.create(:user) }
  let(:root_path) { "/backstage/api/users/" }

  before(:each) { login_and_activate_user(user) }

  describe "PATCH update" do
    it "returns success JSON after updating a user"

    it "returns errors on fail"
  end

  describe "DELETE destroy" do
    it "returns success JSON after deleting a user"
  end
end
