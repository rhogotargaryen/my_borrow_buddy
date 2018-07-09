class LikesController < ApplicationController
    
    def edit
        @like = Like.find_by(id: params[:id])
    end
    
    def update
        @like = Like.find_by(id: params[:id])
        @like.update(rating: params[:like][:rating])
        redirect_to items_path
    end
    
end
    