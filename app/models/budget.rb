class Budget < ApplicationRecord
  belongs_to :author

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end