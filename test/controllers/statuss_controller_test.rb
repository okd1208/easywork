require 'test_helper'

class StatussControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get statuss_create_url
    assert_response :success
  end

  test "should get destroy" do
    get statuss_destroy_url
    assert_response :success
  end

end
