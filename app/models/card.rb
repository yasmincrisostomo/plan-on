class Card < ApplicationRecord
  belongs_to :container
  has_many :tags
end
