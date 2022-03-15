require "test_helper"

class Admin::ExamsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_exams_show_url
    assert_response :success
  end
end
