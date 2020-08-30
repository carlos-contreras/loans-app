class Loan < ApplicationRecord
  PAY_DAY_DEADLINE = 28
  STATUSES = {
    requested: 0,
    declined: 1,
    approved: 2,
    disbursed: 3,
    active: 4
  }.freeze
  INTEREST_TYPES = { effective: 0, nominal: 1 }.freeze
  PERIOD_TYPES = { monthly: 0, quarterly: 1, semesterly: 2, yearly: 3 }.freeze

  belongs_to :user

  enum status: STATUSES
  enum interest_type: INTEREST_TYPES
  enum period_types: PERIOD_TYPES

  validates :pay_day_deadline, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: PAY_DAY_DEADLINE }
  validates :initial_amount, :interest_rate, :periods_count, presence: true
end
