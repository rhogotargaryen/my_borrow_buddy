class LikedItemsController < ApplicationController
    
    def create
        Like.create(user_id: current_user.id, liked_item_id: params[:item_id])
        redirect_to item_url(Item.find_by(id: params[:item_id]))
    end
end
