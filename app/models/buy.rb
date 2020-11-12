class Buy
  #この記述でpurchase,addressモデル両方のパラメータを扱える
  include ActiveModel::Model
  #attr_accessor以降の属性を取得(ゲッター)し更新(セッター)も行ってくれる
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token, :purchase_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/}
  end

  def save 
    #購入者のid,商品のidをpurchase変数に代入
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    #購入者住所を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end