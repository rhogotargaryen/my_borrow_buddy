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
    
    def has_rating?(user, item)
        a = find_like(user, item)
        return !a.rating.nil?
    end
    
    def l_item_rating(item)
        a = LikedItem.find_by(id: item.id)
        b = 0
        c = []
        a.likes.map do |x|
          if !x.rating.nil?
              c << b += x.rating
          end
        end
        if b != 0
            return b / c.length
        else
            return "currently item is unrated"
        end
    end
        
        
end
