class List < ApplicationRecord
  enum status: { collective: 0, personal: 5 }

  belongs_to :user
  has_many :tasks
end
