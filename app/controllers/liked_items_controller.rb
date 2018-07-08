class LikedItemsController < ApplicationController
    
    def create
        a = LikedItem.find_or_create_by(id: params[:item_id])
        Like.create(user_id: current_user.id, liked_item_id: a.id)
        redirect_to user_items_url(current_user)
    end
end
