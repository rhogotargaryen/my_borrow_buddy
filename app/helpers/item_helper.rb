module ItemHelper
    
    def displayable_b_items(items)
        a = borrowable_items(items)
        b = []
        a.each do |x|
            b << x if ![x.owner_id, x.user_id].include?(current_user.id)
        end
        b
    end
    
    def borrowable_items(items)
        b_items = []
        items.each do |x|
           b_items << x if x.can_be_borrowed?
        end
        b_items
    end
    
    def allowable_items(items)
       al_items = []
       items.each do |x|
           al_items << x if x.requested == "submit_borrow"
       end
       al_items
    end
    
    def returnable_items(items)
        ret_items = []
        items.each do |x|
            ret_items << x if x.user_id != x.owner_id && x.requested == "borrowed"
        end
        ret_items
    end
    
    def r_allowable_items(items)
       al_items = []
       items.each do |x|
           al_items << x if x.requested == "submit_return"
       end
       al_items
    end
    
    
end