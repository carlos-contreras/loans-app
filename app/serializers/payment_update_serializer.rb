class PaymentUpdateSerializer
  include JSONAPI::Serializer

  attributes :payment_id, :status, :note, :created_at, :updated_at
end
