require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get home" do
    get :comment_params
    assert_response :success
    
  end
end
