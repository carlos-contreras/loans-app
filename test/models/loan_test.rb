require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  test "should not save loan without pay_day_deadline" do
    loan = loans(:one)
    loan.pay_day_deadline = nil
    assert_not loan.save
  end
  test "should not save loan without pay_day_deadline lower than 28" do
    loan = loans(:one)
    loan.pay_day_deadline = 29
    assert_not loan.save
  end
  test "should not save loan without pay_day_deadline greater than 0" do
    loan = loans(:one)
    loan.pay_day_deadline = -1
    assert_not loan.save
  end
  test "should not save loan without initial_amount" do
    loan = loans(:one)
    loan.initial_amount = nil
    assert_not loan.save
  end
  test "should not save loan without interest_rate" do
    loan = loans(:one)
    loan.interest_rate = nil
    assert_not loan.save
  end
  test "should not save loan without periods_count" do
    loan = loans(:one)
    loan.periods_count = nil
    assert_not loan.save
  end
end
