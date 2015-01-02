class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
<<<<<<< HEAD
      sign_in @user
=======
>>>>>>> bc62d55e3bbb25ec6eca93219083c34fde01c617
      flash[:succes] = "Welcome to the sample app!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
<<<<<<< HEAD
  end
  
  def destroy
=======
>>>>>>> bc62d55e3bbb25ec6eca93219083c34fde01c617
  end
end
