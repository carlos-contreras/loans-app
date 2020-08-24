class LoanUpdate < ApplicationRecord
  belongs_to :loan

  enum status: Loan::STATUSES
end
