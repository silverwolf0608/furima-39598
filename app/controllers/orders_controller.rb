class OrdersController < ApplicationController
  def index
    @purchase_record_address = PurchaseRecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:post_code, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token:params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_69570e78029ea296a6408e37"
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end
end
