require "test_helper"

class PostDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get post_details_show_url
    assert_response :success
  end
end
