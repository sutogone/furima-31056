class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  #購入ページ
  def index
    @buy = Buy.new
  end
  #/購入ページ

  #購入処理
  def create
    @buy = Buy.new(address_params)
    if @buy.valid?   #valid?:バリデーションエラーがあればtrue無ければfalseを返す
      @buy.save
      redirect_to root_path
    else
      render :index
    end
  end
  #/購入処理

  private
  def buy_params
    params.require(:buy).permit(:order_id, :postal_code, :prefecture_id, :city, :address, :phone_number, :building).merge(item_id: params[:item_id], user_id: params[:user_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
