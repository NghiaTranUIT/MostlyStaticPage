class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_param)
    
    if @user.save
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
    else
      # Handle Error here
      render 'new'
    end
  end
  
  private
  def user_param
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
