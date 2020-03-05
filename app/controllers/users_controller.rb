class UsersController < ApplicationController
    before_action :authorized, only: [:show, :edit]
    def new
    end

    def create
        if user_params[:password_confirmation] == user_params[:password]
            new_user = User.create(user_params)
            if new_user.valid?
                flash[:notice] = ["User created successfullly!"]
                redirect_to login_path
            else
                flash.now[:notice] = new_user.errors.full_messages
                render :new
            end
        else
            flash.now[:notice] = ["Password and Password Confirmation do not match. Please try again."]
            render :new
        end
    end

    def show
        @user = current_user
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        @user.update(user_params)
        if @user.valid?
            flash[:notice] = "User updated successfullly!"
            redirect_to @user
        else
            flash.now[:notice] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        user = current_user
        session.delete(:user_id)
        user.destroy
        redirect_to root_path
    end
     
    private
    
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :location_id)
    end
end
