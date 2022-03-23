class SessionsController < ApplicationController

    def new 
    end

    def create 

        @user = User.find_by(name: params[:user][:name])
    

        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to "/"
        else 
            redirect_to "/login"
            flash[:message] = "Error message"
        end
        
    end

    def destroy 
        session.delete :user_id
        redirect_to controller: 'welcome', action: 'home'
    end

end
