class OrdersController < ApplicationController
  def index
    @purchase_record_address = PurchaseRecordAddress.new
  end
end
