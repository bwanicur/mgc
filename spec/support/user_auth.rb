module UserAuth
  def login_and_activate_user(user = nil, pwd = "testing123")
    user ||= FactoryBot.create(:user, password: pwd)
    user.activate!
    post "/sessions", params: { email: user.email, password: pwd }
  end
end
