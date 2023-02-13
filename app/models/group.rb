class Group < ApplicationRecord
  belongs_to :author

  validates :name, presence: true
  validates :icon, presence: true
end
