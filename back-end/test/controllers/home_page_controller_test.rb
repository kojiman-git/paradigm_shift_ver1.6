require "test_helper"

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_page_home_url
    assert_response :success
  end

  test "should get quiz" do
    get home_page_quiz_url
    assert_response :success
  end

  test "should get search" do
    get home_page_search_url
    assert_response :success
  end

  test "should get news" do
    get home_page_news_url
    assert_response :success
  end

  test "should get direct_message" do
    get home_page_direct_message_url
    assert_response :success
  end

  test "should get post" do
    get home_page_post_url
    assert_response :success
  end
end
