class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  default_scope { order :id }
  scope :with_successful_transactions, -> { joins(:transactions).select("invoices.*").merge(Transaction.unscoped.success) }
end
