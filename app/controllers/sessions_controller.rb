class SessionsController < ApplicationController
    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to items_path
        else
            redirect_to '/logins'
        end
    end
end