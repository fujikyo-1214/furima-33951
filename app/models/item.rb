class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :arrival_day
  has_one_attached :image

  with_options presence: true do
  validates :item_name
  validates :item_explanation
  validates :category_id
  validates :condition_id
  validates :shipping_cost_id
  validates :prefecture_id
  validates :arrival_day_id
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :image
  end
end
