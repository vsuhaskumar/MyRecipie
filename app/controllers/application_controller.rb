class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
     @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id] 
     #memoisation => "||="   ........ 
     #if new user, it will go to database ... else if you are in same page, it will take from current user
  end
  
  
  def logged_in?
      !!current_user 
      # if current user is logged in or not
  end
  
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform the action"
      redirect_to :back #stays in same page
    end
  end
  
  
end
