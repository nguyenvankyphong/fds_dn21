class Rate < ApplicationRecord
  validates :product_id, presence: true

  belongs_to :user
  belongs_to :product

  scope :order_by_created_time, ->{order created_at: :desc}
end
