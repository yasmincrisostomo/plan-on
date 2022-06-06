class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :profile_traits, dependent: :destroy
  has_many :containers, dependent: :destroy
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
