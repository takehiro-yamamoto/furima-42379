class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @is_seller = user_signed_in? && current_user.id == @item.user_id
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

def destroy
  item = Item.find(params[:id])
  if item.user == current_user
    item.destroy
    redirect_to root_path
  else
    redirect_to root_path
  end
end

end
private

def item_params
  params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id,
                               :shipping_day_id, :price, :image).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def move_to_index
  redirect_to root_path unless current_user == @item.user
end
