class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :role, :full_name, :address_line_1, :address_line_2, :zip_code,
    :mobile_phone, :created_at, :updated_at
end
