class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :subscription

  validates :issued_at, presence: { message: 'Düzenlenme tarihi boş bırakılamaz' }
  validates :due_at, presence: { message: 'Son ödeme tarihi boş bırakılamaz' }
end
