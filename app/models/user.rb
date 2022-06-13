class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  after_create :create_profiles_traits

  has_many :profile_traits, dependent: :destroy
  accepts_nested_attributes_for :profile_traits

  has_many :containers, dependent: :destroy
  has_many :cards, through: :containers

  has_one_attached :avatar

  has_many :schedules

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def create_profiles_traits
    Trait.all.each do |trait|
      ProfileTrait.create!(user: self, trait: trait, user_answer: 0)
    end
  end
end
