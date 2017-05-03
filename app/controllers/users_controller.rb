class UsersController < ApplicationController
  def index
  	@controllerMessage = "Hello! Hi!"
    @users = User.all
  end

  def show
    @user= User.find(params[:id])
    if (@user == nil)
      @user = User.new
    end
  end

  def new
    @user = User.new
     render(:json => {
       :html => render_to_string(:partial => 'new')
     })
  end

  def create
  	@user = User.new(user_params)
   	if @user.save
      @users = User.all
      render(:json => {
      :html => render_to_string(:partial => 'table')
     })
    else

  	end
  end

  def edit
    @user = User.find(params[:id])
    render(:json => {
       :html => render_to_string(:partial => 'edit'),
       :locals => {:@user => @user}
     })
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)

    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to :action => :index
  end

  def user_params
  	params.require(:user).permit(:first_name,:last_name,:email, :date_of_birth,:active, :phone_no, :mobile_no)
  end
end