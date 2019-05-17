class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :product_id, presence: true
  validates :price, presence: true

  delegate :name, :picture, to: :product, prefix: :product
  delegate :status, :updated_at, to: :order, prefix: :order
end
