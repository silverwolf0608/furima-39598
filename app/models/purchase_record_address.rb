class PurchaseRecordAddress
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :street_address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_code:, prefecture_id:, municipality:,
                   street_address:, building_name:, telephone_number:, purchase_record_id: purchase_record.id)
  end
end
