require "test_helper"

class Admin::TestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_tests_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_tests_show_url
    assert_response :success
  end
end
