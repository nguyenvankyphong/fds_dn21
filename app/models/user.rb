class User < ApplicationRecord
   enum role: {active: 0, admin: 1}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :suggestions
  has_many :orders
  has_many :rates
end
