require "test_helper"

class DucksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get ducks_show_url
    assert_response :success
  end
end
