class LikesController < ApplicationController
    
    def edit
        @like = Like.find_by(id: params[:id])
        byebug
    end
    
    def update
        @like.update(rating: params[:rating])
        redirect_to items_path
    end
    
end
    