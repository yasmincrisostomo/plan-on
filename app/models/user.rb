class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  after_create :create_profiles_traits

  has_many :profile_traits, dependent: :destroy
  has_many :containers, dependent: :destroy
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def create_profiles_traits
    Trait.all.each do |trait|
      ProfileTrait.create!(user: self, trait: trait, user_answer: 0)
    end
  end
end
