class Item < ApplicationRecord

  with_options presence: true do
    validates :name, format: { with: {1,40} }
    validates :info, format: { with: {1,1000} }
  end


  belongs_to :user
  has_one :purchase
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :prefecture
end
