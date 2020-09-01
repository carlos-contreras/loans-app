class LoanSerializer
  include JSONAPI::Serializer

  attributes :user_id, :status, :initial_amount, :interest_type, :interest_rate, :period_type,
    :periods_count, :disbursed_at, :pay_day_deadline, :created_at, :updated_at
end
