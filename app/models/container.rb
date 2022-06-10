class Container < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy

  validates :card_category, presence: true
end
