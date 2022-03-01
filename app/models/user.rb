class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :booking, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :skills, through: :user_skills

  validates :username, presence: true
  validates :bio, presence: true
  validates :bio, length: { minimum: 140 }
  validates :location, presence: true
  validates :birthday, presence: true
end
