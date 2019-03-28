class User < ApplicationRecord
  enum role: [:active, :adm]
  has_many :suggestions
  has_many :orders
  has_many :rates
end
