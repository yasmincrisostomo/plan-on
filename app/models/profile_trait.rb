class ProfileTrait < ApplicationRecord
  belongs_to :user
  belongs_to :trait
end
