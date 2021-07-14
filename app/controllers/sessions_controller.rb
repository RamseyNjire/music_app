class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user.nil?
            render json: "Username or email is incorrect"
        else
            login!(user)
            redirect_to user_url(user)
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end
