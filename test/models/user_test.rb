require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = users(:one)
    user.email = nil
    assert_not user.save
  end
  test "should not save user without mobile_phone" do
    user = users(:one)
    user.mobile_phone = nil
    assert_not user.save
  end
  test "should not save user without password" do
    user = users(:one)
    user.password_digest = nil
    assert_not user.save
  end
end
