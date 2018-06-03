class ApplicationController < ActionController::Base
    helper_method :current_user
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    
    def set_check_user
        check_user
        return head(:forbidden) unless @user == current_user
    end
    
    def check_user
        @user = User.find_by(id: params[:id])
    end
    
end
