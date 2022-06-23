class ApplicationController < ActionController::Base
    # this instance var is going to work on every controller !!! (all instance var in this application_controller.rb)
    helper_method :current_user, :logged_in? # this makes it work like application_helper.rb

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in first."
            redirect_to login_path
        end
    end
end
