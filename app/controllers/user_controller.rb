class UserController < ApplicationController
  def index
  	@controllerMessage = "Hello! Hi!"
  	@users = User.all
  end

  def new
  end

  def create
  	@users = User.new(user_params)
  	@users.save
  	redirect_to @users
  end

  def show 
  	@user= User.find(params[:id])
  end


  private
  def user_params
  	params.require(:user).permit(:first_name,:last_name,:email, :date_of_birth, :phone_no, :mobile_no)
  end
end
