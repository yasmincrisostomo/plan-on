class Tag < ApplicationRecord
  belongs_to :card

  validates :name, presence: true
  validates :color, presence: true
end
