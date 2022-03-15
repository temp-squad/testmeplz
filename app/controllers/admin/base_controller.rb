class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("admin_username", "admin"), password: ENV.fetch("admin_password", "password")
end
