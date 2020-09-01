class PaymentSerializer
  include JSONAPI::Serializer

  attributes :loan_id, :status, :note, :principal_amount, :interest_amount, :created_at,
    :updated_at
end
