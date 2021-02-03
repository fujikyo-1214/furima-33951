require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe "出品機能" do
    context "出品出来るとき" do
      it "item_name,item_explanation,category_id,condition_id,shipping_cost_id,prefecture_id,arrival_day_id,price,imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceが半角数字であれば登録できる" do
        @item.price
        expect(@item).to be_valid
      end
    end
    context "出品出来ないとき" do
      it "item_nameが空では登録できない" do 
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_explanationが空では登録できない" do
        @item.item_explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it "category_idが1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "condition_idが1では登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it "shipping_cost_idが1では登録できない" do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost Select")
      end
      it "prefecture_idが1では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it "arrival_day_idが1では登録できない" do
        @item.arrival_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Arrival day Select")
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "pliceが半角数字以外では登録できない" do
        @item.price = "rrrr"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300未満であれば登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10000000以上であれば登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
