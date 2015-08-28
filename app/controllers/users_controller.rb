class UsersController < ApplicationController

		before_action :require_user
  

  def index
    @users = User.all
  end

  def info 
   @user = User.find(session[:user_id])
  end


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create

  @user = User.new(users_params)

  if @user.save
    redirect_to '/'
  else
    redirect_to '/users/new'
  end
end


def update
    @user = User.find(params[:id])
    @user.update!(users_params)
    redirect_to '/users/show/'+"#{@user.id}"
end

 
 
 def destroy
 	@user = User.find(params[:id])
   	if @user.destroy
   	 redirect_to '/users'
   	end
  end

  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password , :newsletter ,:salt)
    end


end
