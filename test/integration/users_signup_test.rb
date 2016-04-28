require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "Invalid sign up information" do
    get signup_path
    
    assert_no_difference 'User.count' do
      post users_path, user: {name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar"}
    end
    
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get signup_path
    
    assert_difference 'User.count', 1 do 
      
      post users_path, user: {name:  "nghiatran123",
                               email: "vinhnghia@gmail.com",
                               password:              "thenotebook",
                               password_confirmation: "thenotebook"}
                               
      end
      
      assert_template 'users/show'
  end
end
