class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :prefecture_id, :post_number, :area, :area_number, :building, :number, :user_id, :item_id

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" } 
    validates :area
    validates :area_number
    validates :number, length: { maximum: 11, message: "Input only number"}
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, area: area, area_number: area_number, building: building, number: number, purchase_record_id: purchase_record)
  end
end