module Backstage
  class HomeController < ApplicationController
    layout "backstage"

    before_action :require_login

    def home
      # reactjs app
    end
  end
end
