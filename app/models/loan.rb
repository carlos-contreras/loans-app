class Loan < ApplicationRecord
  PAY_DAY_DEADLINE = 28
  STATUSES = {
    requested: 0,
    declined: 1,
    declined: 2,
    disbursed: 3,
    disbursed: 4
  }

  belongs_to :user

  enum status: STATUSES
  enum interest_type: { effective: 0, nominal: 1 }
  enum period_types: { monthly: 0, quarterly: 1, semesterly: 2, yearly: 3 }

  validates :pay_day_deadline, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: PAY_DAY_DEADLINE }
end
