module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
  end
  
  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:made_token] = user.made_token
  end
  
   # Returns the user corresponding to the made token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:made_token])
        sign_in user
        @current_user = user
     end
    end
  end
  
   # returns true if the user is logged in, false otherwise.
  def signed_in?
    !current_user.nil?
  end
  
  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:made_token)
  end
    
   #Logs out the current user.
  def sign_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
