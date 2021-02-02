class Item < ApplicationRecord
  belongs_to :user
  belongs_to :arrival_day
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_cost
  has_one_attached :image

  with_options presence: true do
  validates :item_name
  validates :item_explanation
  validates :category_id
  validates :condition_id
  validates :shipping_cost_id
  validates :prefecture_id
  validates :arrival_day_id
  validates :plice, length: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :image
  end
end
