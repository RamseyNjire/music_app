class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end



    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
