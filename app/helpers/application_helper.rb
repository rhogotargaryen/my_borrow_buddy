module ApplicationHelper
    def show_obj_info(user)
        a = []
        user.attributes.each do |k, v|
            if ['username', 'name', 'email'].include?(k)
                a << "#{k.capitalize}: #{v}"
            end
        end
        a
    end
    
    def show_item_info(item)
        a = []
        item.attributes.each do |k, v|
            if ['desc', 'name', 'value'].include?(k)
                a << "#{k.capitalize}: #{v}"
            elsif k == 'owner_id'
                a << "Belongs to User: #{User.find_by(id: item.owner_id).name}"
            end
        end
        a
    end

end
