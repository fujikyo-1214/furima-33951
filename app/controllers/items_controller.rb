class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  

  def index
    @items = Item.all.order(created_at:"DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
  @item.destroy
  redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :arrival_day_id, :price, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def move_to_index
    if @item.user.id != current_user.id || @item.purchase_record.present?
      redirect_to action: :index
    end
  end
end
