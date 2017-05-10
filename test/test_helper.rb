ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
 def json_response
    @json_response = JSON.parse(@response.body)
  end
 def user_params
 	user = users(:user_info)
 	{
 		:user=>{
 			:first_name => user.first_name,
 			:last_name => user.last_name,
 			:email => user.email,
 			:date_of_birth => user.date_of_birth,
 			:active => user.active,
 			:phone_no => user.phone_no,
 			:mobile_no => user.mobile_no
 		} 
 	} 	
 end
end
