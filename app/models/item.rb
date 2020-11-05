class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_one :purchase

  with_options presence: true do
    validates :name,                    length: { in: 1..40 }
    validates :info,                    length: { in: 1..1000 }
    validates :item_price,              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :category_id,             numericality: { other_then: 1 }
    validates :sales_status_id,         numericality: { other_then: 1 }
    validates :shipping_fee_id,         numericality: { other_then: 1 }
    validates :scheduled_delivery_id,   numericality: { other_then: 1 }
    validates :prefecture_id,           numericality: { other_then: 1 }
  end
end
