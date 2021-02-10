class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_item_index, only: :index
  def index
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:post_number, :prefecture_id, :area, :area_number, :building, :number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_item_index
    @item = Item.find(params[:item_id])
    if @item.user.id == current_user.id || @item.purchase_record.present?
      edirect_to root_path
    end
  end
end