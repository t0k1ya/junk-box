require 'test_helper'

class Admin::AdminsTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
  end

  test "should draft article" do
    post draft_admin_articles_path, params: {
    }
    assert_redirected_to admin_url(@admin)
  end
end
