require "test_helper"

class QuizChallengeControllerTest < ActionDispatch::IntegrationTest
  test "should get next_quiz" do
    get quiz_challenge_next_quiz_url
    assert_response :success
  end

  test "should get previous_quiz" do
    get quiz_challenge_previous_quiz_url
    assert_response :success
  end

  test "should get check_the_answer" do
    get quiz_challenge_check_the_answer_url
    assert_response :success
  end
end
