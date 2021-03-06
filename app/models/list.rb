class List < ApplicationRecord
  enum status: { collective: 0, personal: 5 }

  belongs_to :user
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true

  validates :name, :status, presence: true
  
end
