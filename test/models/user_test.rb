require 'test_helper'

class UserTest < ActiveSupport::TestCase 

   test "saving user without last_name and email details" do 
 		user = User.new
 		user.first_name = users(:user_info).first_name
 		assert user.save, "user can't be saved without last_name and email"
   end

  test "saving user without first_name and email details" do
 		user = User.new
 		user.last_name = users(:user_info).last_name
  		assert user.save, "user can't be saved without last_name and email"
   end 

  test "saving user without first_name and last_name details" do
  	    user = User.new
 		user.email = users(:user_info).email
   	 	assert user.save, "user can't be saved without first_name and last_name"
  end

  test "saving user without first_name" do
 		user = User.new
 		user.last_name = users(:user_info).last_name
 		user.email = users(:user_info).email
 		assert user.save, "user can't be saved without first_name"
  end

  test "saving user without last_name" do
		user = User.new
 		user.first_name = users(:user_info).first_name
 		user.email = users(:user_info).email
    	assert user.save, "user can't be saved without last_name"
  end

  test "saving user without email" do
	 	user = User.new
 		user.first_name = users(:user_info).first_name
 		user.last_name = users(:user_info).last_name
  		assert user.save, "user can't be saved without email"
  end

  test "saving user without proper email format" do
	 	user = User.new
 		user.first_name = users(:user_info).first_name
 		user.last_name = users(:user_info).last_name
 		user.email = users(:user_invalid_email).email
 	 	assert user.save, "user can't be saved without proper email id"
  end 

  test "saving user with proper user credentials" do
	 	user = User.new
 		user.first_name = users(:user_info).first_name
 		user.last_name = users(:user_info).last_name
 		user.email = users(:user_info).email
 	    assert user.save, "user can't be saved without proper email id"
  end 
end
