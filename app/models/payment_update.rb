class PaymentUpdate < ApplicationRecord
  belongs_to :payment

  enum status: Payment::STATUSES
end
