class User < ApplicationRecord
  enum role: { customer: 0, admin: 1 }
end
