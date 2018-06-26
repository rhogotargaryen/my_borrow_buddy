class SessionsController < ApplicationController
    
    def new
        if session[:user_id]
            @message = "you are already logged in"
            redirect_to user_path(current_user, :message => @message)
        end
        @user = User.new
    end
    
    def create
        if auth_hash
            @user = User.find_or_create_by_oauth(auth_hash)
            session[:user_id] = @user.id
            redirect_to '/test'
        else @user = User.find_by(name: params[:user][:name])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to '/test'
            else
                redirect_to '/signin'
            end
        end
    end
    
    def destroy
        session.destroy
        redirect_to root_url
    end
    
    def auth_hash
      request.env['omniauth.auth']
    end
    
end