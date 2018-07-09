# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :logged_and_owns_item
  before_action :logged_in?, only: %i[new create]

  skip_before_action :logged_and_owns_item, only: %i[index show new create]

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @items = @user.items
      @o_items = Item.owned_by(@user.id)
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
    @item.requested = 'added_item'
    if @item.save
      @item.transactions << Transaction.new(category: 'add_item', recipient_id: current_user.id)
      LikedItem.create(item_id: @item.id)
      redirect_to item_url(@item)
    else
      @messages = @item.errors
      render :new
    end
  end

  def show
    set_item
    redirect_to items_path(message: 'item not found') if @item.nil?
  end

  def edit
    @item = Item.find_by(params[:item_id])
    if @item.owner_id != current_user.id
      redirect_to items_url(message: 'you do not have permission to edit that item')
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_url(@item)
    else
      render :edit
    end
  end

  def delete
    @item.delete
    redirect_to user_url(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:name, :value, :desc)
  end
end
