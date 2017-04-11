class WelcomeController < ApplicationController
	def index
		@controllerMessage = "Hello! Hi!"
	end

	def sample 
		@user = User.find_by_email(params[:email])
	end
end
