class PurchaseRecordAddress

  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number, :user_id, :item_id
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :municipality, presence: true
  validates :street_address, presence: true
  validates :telephone_number, presence: true, length: { in: 10..11 }, numericality: { only_integer: true}
  validates :user_id, presence: true
  validates :item_id, presence: true


  attr_accessor :token
  validates :token, presence: true

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end