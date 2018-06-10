class ItemsController < ApplicationController
    before_action :logged_and_owns_itenm
    before_action :logged_in?, only: [:new, :create]
    
    skip_before_action :logged_and_owns_itenm, only: [:index, :show, :new, :create]
    
    def index
        if params[:user_id]
            @items = User.find_by(id: params[:user_id]).items
        else
            @items = Item.all
        end
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        @item.owner_id = current_user.id
        @item.user = current_user
        @item.requested = "added_item"
        byebug
        if @item.save
            @item.transactions << Transaction.new(category: "add_item", recipient_id: current_user.id)
            redirect_to item_url(@item)
        else
            render :new
        end
    end
    
    def show
        set_item
    end
    
    def edit
    end
    
    def update
        if @item.save
            redirect_to item_url(@item)
        else
            render :edit
        end
    end
    
    private
    
    def item_params
        params.require(:item).permit(:name, :value, :desc)
    end
end
