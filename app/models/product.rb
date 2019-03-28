class Product < ApplicationRecord
  has_many :rates
  has_many :order_products
  belongs_to :category
end
