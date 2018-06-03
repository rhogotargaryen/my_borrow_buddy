module ApplicationHelper
    def show_obj_info(obj)
        a = []
        obj.attributes.each do |k, v|
            if ['username', 'name', 'email'].include?(k)
                a << "#{k.capitalize}: #{v}"
            end
        end
        a
    end
end
