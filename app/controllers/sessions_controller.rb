class SessionsController < ApplicationController
  def new
  end
  
  def create
    
    ap params
    
    # Find User first
    email = params[:session][:email].downcase
    pass= params[:session][:password]
    
    user = User.find_by(email: email)
    if user && user.authenticate(pass)
      # Success
      redirect_to user
    else
      # Error
      flash[:danger] = "Invalid emai/password combination"
      render 'new'
    end
  end
  
  def destroy
    
  end
end
