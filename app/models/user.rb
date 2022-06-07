class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  after_create :create_profiles_traits

  has_many :profile_traits, dependent: :destroy
  accepts_nested_attributes_for :profile_traits

  has_many :containers, dependent: :destroy
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
