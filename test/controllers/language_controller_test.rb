require "test_helper"

class LanguageControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get language_update_url
    assert_response :success
  end
end
