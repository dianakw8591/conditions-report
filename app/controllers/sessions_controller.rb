class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(username: user_params[:username])
        if @user && @user.authenticate(user_params[:password])
            login_user(@user)
            redirect_to @user
        else
            flash.now[:notice] = ["Incorrect username or password"]
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:notice] = ["Logout Successful"]
        redirect_to login_path
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
