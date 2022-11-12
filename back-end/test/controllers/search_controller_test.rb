require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get post-search" do
    get search_post-search_url
    assert_response :success
  end
end
