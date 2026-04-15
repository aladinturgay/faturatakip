class User < ApplicationRecord
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions
  has_many :invoices
end
