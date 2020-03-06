class SearchController < ApplicationController
    def index
        location = Location.find(params[:location][:id])
        @posts = location.posts.select do |post|
            params[:min].to_f <= post.snowpack && post.snowpack <= params[:max].to_f
        end
    end

end
