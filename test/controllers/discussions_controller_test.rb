require "test_helper"

class DiscussionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get discussions_index_url
    assert_response :success
  end

  test "should get new" do
    get discussions_new_url
    assert_response :success
  end

  test "should get create" do
    get discussions_create_url
    assert_response :success
  end

  test "should get show" do
    get discussions_show_url
    assert_response :success
  end
end
