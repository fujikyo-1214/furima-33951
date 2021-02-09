class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    # binding.pry
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)
    if @purchase_record_address.valid?
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:post_number, :prefecture_id, :area, :area_number, :building, :number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end