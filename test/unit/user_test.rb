require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "name and email" do
    u = User.new
    u.name = "tom"
    u.email = "mail"
    assert_equal("tommail",u.name_email)
  end
end
