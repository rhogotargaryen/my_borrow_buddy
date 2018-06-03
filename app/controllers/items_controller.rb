class ItemsController < ApplicationController
    before_action :check_user
    
    def new
        @item = Item.new
    end
    
end