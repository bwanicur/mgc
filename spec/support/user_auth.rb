module UserAuth

  def login_and_activate_user(user=nil)
    user ||= FactoryBot.create(:user, password: 'testing123')
    user.activate!
    post "/sessions", params: {email: user.email, password: "testing123"}
  end
end
