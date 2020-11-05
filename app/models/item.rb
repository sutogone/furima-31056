class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  with_options presence: true do
    validates :name, format: { with: {1,40} }
    validates :info, format: { with: {1,1000} }
    validates :item_price, format: { with:  }
  end

  with_options numericality_of: {other_then: 1} do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :scheduled_delivery_id
    validates :prefecture_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :prefecture
end
