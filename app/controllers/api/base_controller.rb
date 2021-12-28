module API
  class BaseController < ApplicationController
    before_action :require_login

    rescue_from ActiveRecord::RecordNotFound do |e|
      render_error(e, 404)
    end

    FOUR_22_EXCEPTIONS = [
      ActiveRecord::RecordInvalid,
      ActiveRecord::RecordNotSaved,
      ActiveRecord::RecordNotUnique,
      ArgumentError
    ].freeze
    rescue_from *FOUR_22_EXCEPTIONS do |e|
      render_error(e, 422)
    end

    rescue_from ActiveRecord::RecordNotDestroyed do |e|
      render_error(e, 500)
    end

    private

    def render_error(exception, status_code)
      render json: { msg: exception.message }, status: status_code
    end
  end
end
