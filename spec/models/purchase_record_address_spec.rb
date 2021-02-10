require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  before do
    @purchase_record = FactoryBot.build(:purchase_record_address)
  end
  describe '商品購入' do
    context '購入できるとき' do
      it 'post_number,prefecture_id,area,area_number,number,tokenが存在すれば登録できる' do
      expect(@purchase_record).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @purchase_record.building = nil
        expect(@purchase_record).to be_valid
      end
    end
    context '購入できないとき' do
      it 'post_numberが空では登録できない' do
        @purchase_record.post_number = nil
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberが7桁の数字とハイフンを含んでいなければ登録できない' do
        @purchase_record.post_number = 1111111
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Post number Input correctly")
      end
      it 'prefecture_idが1では登録できない' do
        @purchase_record.prefecture_id = 1
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Prefecture Select")
      end
      it 'areaが空では登録できない' do
        @purchase_record.area = nil
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_numberが空では登録できない' do
        @purchase_record.area_number = nil
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Area number can't be blank")
      end
      it 'numberが空では登録できない' do
        @purchase_record.number = nil
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Number can't be blank")
      end
      it 'numberは11桁以内でなければ登録できない' do
        @purchase_record.number = "090123456789"
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Number Input only number")
      end
      it "tokenが空では登録できないこと" do
        @purchase_record.token = nil
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

