require "test_helper"

class HeadIconControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get head_icon_profile_url
    assert_response :success
  end

  test "should get follows_list" do
    get head_icon_follows_list_url
    assert_response :success
  end

  test "should get followers_list" do
    get head_icon_followers_list_url
    assert_response :success
  end

  test "should get app_detailed_description" do
    get head_icon_app_detailed_description_url
    assert_response :success
  end

  test "should get quiz_list" do
    get head_icon_quiz_list_url
    assert_response :success
  end
end
