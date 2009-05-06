# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time

  helper_method :is_admin?
  helper_method :is_logged_in?
  helper_method :is_superuser?

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => '69f6aec0822afdca661f067f4d07917c'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

protected

  def authenticate
    authorized = authenticate_or_request_with_http_basic do |username, password|
      @current_user = User.find(:first, :conditions => ["email = ? AND password = ?", username, password])
      if @current_user.nil?
        session[:admin] = false
        session[:superuser] = false
        session[:logged_in] = false
      else
        session[:admin] = @current_user.is_admin?
        session[:superuser] = @current_user.is_superuser?
        session[:logged_in] = true
      end
      session[:logged_in]
    end
  end

  def is_logged_in?
    session[:logged_in] || false
  end

  def is_admin?
    session[:admin] || false
  end

  def is_superuser?
    session[:superuser] || false
  end

  def authenticate_admin
    redirect_to :controller => 'initiatives' unless is_admin?
  end

  def authenticate_superuser
    redirect_to :controller => 'initiatives' unless is_superuser?
  end

end

