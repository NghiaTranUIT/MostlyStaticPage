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
  
  test "name should be presence" do
    @user.name = "    "
    assert_not @user.valid?
  end
  
  test "email should be presence" do
    @user.email = "    "
    assert_not @user.valid?
  end
  
  test "name shouldn't be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
  test "Email shouldn't too long" do
    @user.email = "b" * 300
    assert_not @user.valid?
  end
  
  test "email validation should accept valid email" do
    
    valid_address = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    
    valid_address.each do |item|
      @user.email = item
      assert @user.valid?, "#{item.inspect} should be valid"
    end
  end
  
  test "Email validation should reject invalid email" do
    invalid_address = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
                           
    invalid_address.each do |item|
      @user.email = item
      
      assert_not @user.valid?, "#{item.inspect} should be invalid"
    end
  end
  
  test "Email address should be unique" do
    duplicated_user = @user.dup 
    duplicated_user.email = @user.email.upcase
    
    @user.save
    assert_not duplicated_user.valid?
  end
end
