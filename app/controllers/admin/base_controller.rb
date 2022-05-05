class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :set_current_company

  def current_company 
    @current_company ||= current_user.company
  end

  alias set_current_company current_company
  helper_method :current_company
  # http_basic_authenticate_with name: ENV.fetch("admin_username", "admin"), password: ENV.fetch("admin_password", "password")
end
