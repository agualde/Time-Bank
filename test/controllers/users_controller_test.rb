require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get users_destroy_url
    assert_response :success
  end
end
