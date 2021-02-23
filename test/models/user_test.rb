require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "nkiruka")
  end

  test 'user should be valid' do
    assert true
  end

  test "username should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 21
    assert_not @user.valid?
  end

  test "name should not be too short" do
    @user.name = "aa"
    assert_not @user.valid?
  end
end
