require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @valid_user = User.new(
      name: 'Tom',
      email: 'tom@example.com',
      password: 'foobar',
      password_confirmation: 'foobar'
    )

    @invalid_user = User.new(
      name: '',
      email: 'tom@example',
      password: 'foo',
      password_confirmation: 'bar'
    )
  end

  test "should be valid" do
    assert @valid_user.valid?
  end

  test "should be invalid" do
    assert_not @invalid_user.valid?
  end

end
