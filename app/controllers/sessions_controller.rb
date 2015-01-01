class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
     sign_in user
     params[:session][:remember_me] == '1' ? remember(user) : forget(user)
     redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
    sign_out if signed_in?
    flash[:error] = 'Logged out'
    redirect_to home_path
  end
  
end
