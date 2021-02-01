class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :item_name
  validates :item_explanation
  validates :category_id
  validates :condition_id
  validates :shipping_cost_id
  validates :prefecture_id
  validatas :arrival_day_id
  validatas :plice
  validates :image
end
