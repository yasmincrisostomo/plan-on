class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  after_create :create_profiles_traits

  has_many :profile_traits, dependent: :destroy
  accepts_nested_attributes_for :profile_traits

  has_many :containers, dependent: :destroy
  has_one_attached :avatar

  has_many :schedules

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def create_profiles_traits
    Trait.all.each do |trait|
      ProfileTrait.create!(user: self, trait: trait, user_answer: 0)
    end
  end


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(name: data['name'],
    email: data['email'],
    password: Devise.friendly_token[0, 20])
    user
  end

end
