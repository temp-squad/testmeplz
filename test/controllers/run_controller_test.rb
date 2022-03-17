require "test_helper"

class RunControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get run_create_url
    assert_response :success
  end
end
