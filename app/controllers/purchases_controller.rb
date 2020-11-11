class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  #購入ページ
  def index

  end
  #/購入ページ

  #購入処理
  def create
    
  end
  #/購入処理
end
