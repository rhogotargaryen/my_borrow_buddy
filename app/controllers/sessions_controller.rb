class SessionsController < ApplicationController
    
    def new
        if session[:user_id]
            @message = "you are already logged in"
            redirect_to user_path(current_user, :message => @message)
        end
        @user = User.new
    end
    
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/test'
        else
            redirect_to '/signin'
        end
    end
    
    def destroy
        session.destroy
        redirect_to root_url
    end
    
end