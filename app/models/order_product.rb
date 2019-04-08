class OrderProduct < ApplicationRecord

  attr_accessor  :quantity

  belongs_to :product
  belongs_to :order

  validates :product_id, presence: true
  validates :price, presence: true
  validate :quantity_is_available

  private

  def quantity_is_available
    product = Product.find_by id, :product_id
    available_quantity = product.quantity
    if quantity > available_quantity
      errors.add(:quantity, " - Please order only what's available")
    end
  end
end
