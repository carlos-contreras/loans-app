require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should authenticate the user" do
    User.create(email: "test@email.com", password: "test1234", mobile_phone: "555 555 5555")
    post api_authentication_url, params: { email: "test@email.com", password: "test1234" }

    assert_response :success
  end
  test "should not authenticate the user with worong password" do
    User.create(email: "test@email.com", password: "test1234", mobile_phone: "555 555 5555")
    post api_authentication_url, params: { email: "test@email.com", password: "wtest1234" }

    assert_response 401
  end
  test "should not authenticate the user with worong email" do
    User.create(email: "test@email.com", password: "test1234", mobile_phone: "555 555 5555")
    post api_authentication_url, params: { email: "testt@email.com", password: "test1234" }

    assert_response 401
  end
end
