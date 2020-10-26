require 'test_helper'

class PrivatetasksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get privatetasks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get privatetasks_destroy_url
    assert_response :success
  end

end
