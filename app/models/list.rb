class List < ApplicationRecord
  enum status: [ :collective, :personal ]

  belongs_to :user
end
