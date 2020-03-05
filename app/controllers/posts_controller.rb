class PostsController < ApplicationController
    before_action :authorized, only: [:new, :edit]
    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params.merge(user_id: current_user.id))
        redirect_to @post
    end

    def show
        @post = Post.find(params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:location_id, :date, :title, :content)
    end



end
