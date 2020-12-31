require 'test_helper'

class Admin::SessionsTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
  end

  test "should login successfully" do
    post admin_login_path, params: {
      session: {
        email: @admin.email,
        password: 'jjjjjj'
      }
    }
    assert_redirected_to @admin

  end
end
