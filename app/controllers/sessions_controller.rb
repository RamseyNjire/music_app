class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user.nil?
            render json: 'Email or password is incorrect'
        else
            render json: "Successful login, #{user.username}!"
        end
    end
end
