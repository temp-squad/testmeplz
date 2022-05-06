require "test_helper"

class TestSetsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get test_sets_show_url
    assert_response :success
  end
end
