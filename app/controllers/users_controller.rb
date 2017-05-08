=begin
Resourceful user controller class that handles all the requests 
received from the browser to appropriate action after routing. 
=end

class UsersController < ApplicationController

  #Index action that represents the index template 
  def index
  	@controllerMessage = "Hello! Hi!"
    @users = User.all
  end

  #Show action that represents the show template
  def show
    @user= User.find(params[:id])
    render(:json => {
       :html => render_to_string(:template => 'users/show')
     })
  end

  #New action that represents the new partial
  def new
    @user = User.new
     render(:json => {
       :html => render_to_string(:partial => 'new')
     })
  end

  #Create action which saves the user's information
  def create
  	@user = User.new(user_params)
   	if @user.save
      @users = User.all
      render(:json => {
      :html => render_to_string(:partial => 'table')
     })
  	end
  end

  #Edit action that represents the edit partial
  def edit
    @user = User.find(params[:id])
    render(:json => {
       :html => render_to_string(:partial => 'edit')
     })
  end

  #Update action that updates the user's information
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) 
      @users = User.all    
      render(:json => {
      :html => render_to_string(:partial => 'table')
     })
    end
  end

  #Destry action that deletes the user's information
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      @users = User.all
      render(:json => {
      :html => render_to_string(:partial => 'table')
     })
    end
  end

  #user_params that permits only the strong parameters of the form.  
  def user_params
  	params.require(:user).permit(:first_name,:last_name,:email, :date_of_birth,:active, :phone_no, :mobile_no)
  end
end