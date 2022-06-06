class Card < ApplicationRecord
  belongs_to :container
  has_many :tags
  has_one_attached :image

  validates :title, presence: true
end
