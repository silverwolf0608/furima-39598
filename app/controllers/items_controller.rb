class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_item, only: [:show, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    puts "Item params: #{item_params.inspect}"
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if user_signed_in?
      redirect_to action: :index unless user_signed_in? && current_user == @item.user
    else
      redirect_to new_user_session_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id,
                                 :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
