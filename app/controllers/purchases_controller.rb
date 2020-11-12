class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  #購入ページ
  def index
    if @item.user_id == current_user.id || @item.order != nil     #購入済み商品の購入ページに遷移しようとすると、トップページに遷移する
      redirect_to root_path
    end
    @buy = Buy.new
  end
  #/購入ページ

  #購入処理
  def create
    @buy = Buy.new(address_params)
    if @buy.valid?   #valid?:バリデーションエラーがあればtrue無ければfalseを返す
      pay_item
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,            #商品の値段
      card: address_params[:token],   #カードのトークン
      currency: 'jpy'                 #通貨の種類
    )
  end

end
