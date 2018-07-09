# frozen_string_literal: true

module ItemHelper
    def liked_already?(item)
        if LikedItem.find_by(id: item.id).users.include?(current_user)
            return true
        else
            return false
        end
    end
    
    def like_count(item)
        a = LikedItem.find_by(id: item.id)
        return a.users.count
    end
    
    def find_like(user, item)
        user.likes.find_by(liked_item_id: item.id)
    end
end
