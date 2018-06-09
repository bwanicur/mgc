class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def has_paginate_params?
    params[:page].present?
  end

  def page_param
    params[:page] || 1
  end

end
