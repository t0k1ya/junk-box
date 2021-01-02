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
    assert_redirected_to admin_url(@admin)
  end

  test "should redirect to admin page when you already logged in" do
    post admin_login_path, params: {
      session: {
        email: @admin.email,
        password: 'jjjjjj'
      }
    }
    get admin_login_path
    assert_redirected_to admin_url(@admin)
  end

  test "shouldn show login page when you haven't logged in" do
    get admin_login_path
    # assert_template コントローラ名/メソッド名
    assert_template 'sessions/new'
  end
end
