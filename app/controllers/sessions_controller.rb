class SessionsController < ApplicationController
    
  skip_before_filter :require_login
    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to items_path
        else
            redirect_to '/logins'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end