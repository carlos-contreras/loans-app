require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test "should not save payment without loan_id" do
    payment = payments(:one)
    payment.loan_id = nil
    assert_not payment.save
  end
end
