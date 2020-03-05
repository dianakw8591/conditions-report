class PostsController < ApplicationController
    before_action :authorized, only: [:new, :edit, :destroy]
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

    def edit
        byebug
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to @post
    end

    def destroy
        @post = Post.find(params[:id])
        @post.photos.purge
        @post.destroy
        flash[:notice] = "Post deleted successfully"
        redirect_to user_path(current_user)
    end

    private

    def post_params
        params.require(:post).permit(:location_id, :date, :title, :content, photos: [])
    end



end
