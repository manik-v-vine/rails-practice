class UserController < ApplicationController
  def index
  	@controllerMessage = "Hello! Hi!"
  	@users = User.all
  end

  def new
  	@users = User.new
  end


  def show 
  	@user= User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
   	if @user.save
  		redirect_to @user
  	else 
  		render 'new'
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:first_name,:last_name,:email, :date_of_birth,:active, :phone_no, :mobile_no)
  end
end