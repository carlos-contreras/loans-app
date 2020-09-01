class LoanUpdateSerializer
  include JSONAPI::Serializer

  attributes :user_id, :loan_id, :note, :created_at, :updated_at
end
