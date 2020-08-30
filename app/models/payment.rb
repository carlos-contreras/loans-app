class Payment < ApplicationRecord
  STATUSES = {
    created: 0,
    canceled: 1,
    failed: 2,
    processing: 3,
    succeeded: 4,
    action_required: 5
  }

  belongs_to :loan

  enum status: STATUSES
end
