require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: "Todd")
  end

  test "should get users index" do
    get users_path
    assert_response :success
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end
end
