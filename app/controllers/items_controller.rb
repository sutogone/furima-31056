class ItemsController < ApplicationController
  before_action :set_item, only: [:edit,:update,:show,:destroy]
  before_action :authenticate_user!, only: [:new,:edit]          #authenticate_user!とすることで、対象のアクションが未ログインユーザーによって実行された場合ログイン画面へ自動で遷移する。

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new                #newアクションが呼ばれたら新たにインスタンス@itemを生成
  end

  def show
    
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)   #new.html.erb内のsubmitボタンが押されたらcreateアクションが実行され、引数に指定しているitem_paramsが働く。
    if @item.save                   #もし@itemの中身に正しくフォームが保存されたら
      redirect_to root_path         #保存に成功したら初期ページに戻る
    else
      render :new                   #保存に失敗したらnew.html.erbが呼ばれる
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :info, :category_id, :sales_status_id, :shipping_fee_id, :scheduled_delivery_id, :item_price, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
