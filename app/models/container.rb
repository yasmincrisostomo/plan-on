class Container < ApplicationRecord
  belongs_to :user
  has_many :cards

  validates :card_category, presence: true
end
