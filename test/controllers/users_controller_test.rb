require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "users#index"
    assert_response :success
  end

  test "should get new user path" do
  	get "users/new"
  	assert_response :success
  end

  test "ajax request" do 
 	get "users/new", xhr: true
 	assert_equal "application/json", @response.content_type
  end

end
