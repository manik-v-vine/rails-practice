require_relative '../../test/test_helper'

class UserTest < ActiveSupport::TestCase 
  def test_user_without_any_details
    user = User.new
    assert user.save, "user can't be saved without any details"
  end

  def test_user_without_last_name_and_email
 		user = User.new
 		user.first_name = users(:user_info).first_name
 		assert user.save, "user can't be saved without last_name and email"
  end

  def utest_user_without_first_name_and_email
 		user = User.new
 		user.last_name = users(:user_info).last_name
  	assert user.save, "user can't be saved without first_name and email"
  end 

  def test_user_without_first_name_and_last_name
  	user = User.new
 		user.email = users(:user_info).email
   	assert user.save, "user can't be saved without first_name and last_name"
  end

  def test_user_without_first_name
 		user = User.new
 		user.last_name = users(:user_info).last_name
 		user.email = users(:user_info).email
 		assert user.save, "user can't be saved without first_name"
  end

  def test_user_without_last_name
		user = User.new
 		user.first_name = users(:user_info).first_name
 		user.email = users(:user_info).email
    assert user.save, "user can't be saved without last_name"
  end

  def test_user_without_email
	 	user = User.new
 		user.first_name = users(:user_info).first_name
 		user.last_name = users(:user_info).last_name
  	assert user.save, "user can't be saved without email"
  end

  def test_user_without_proper_email
	 	user = User.new
 		user.first_name = users(:user_info).first_name
 		user.last_name = users(:user_info).last_name
 		user.email = users(:user_invalid_email).email
 	 	assert user.save, "user can't be saved without proper email id"
  end 


  def test_user_with_proper_details
	 	user = User.new
 		user.first_name = users(:user_info).first_name
 		user.last_name = users(:user_info).last_name
 		user.email = users(:user_info).email
 	  assert user.save, "user can't be saved without proper email id"
  end 
end
