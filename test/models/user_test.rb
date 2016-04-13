require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(name: "Nghia Tran", email: "vinhnghiatran@gmail.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "should be presence" do
    @user.name = "    "
    assert_not @user.valid?
  end
end
