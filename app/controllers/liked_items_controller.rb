class LikedItemsController < ApplicationController
    
    def create
        Like.create(user_id: current_user.id, liked_item_id: params[:format])
        redirect_to items_path
    end
end
