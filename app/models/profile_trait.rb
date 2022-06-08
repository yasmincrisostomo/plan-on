class ProfileTrait < ApplicationRecord

  validates :user_answer, presence: true

  belongs_to :user
  belongs_to :trait
end
