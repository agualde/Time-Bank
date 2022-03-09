class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :user_reviews, dependent: :destroy
  has_many :reviews, through: :user_reviews, dependent: :destroy

  has_many :favorite_projects, through: :favorites, source: :project
  has_many :booked_projects, through: :bookings, source: :project

  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills


  has_one_attached :photo

  has_many :messages
  has_many :notifications
  has_many :chatrooms_as_sender, class_name: "Chatroom", foreign_key: :asker_id, dependent: :destroy
  has_many :chatrooms_as_receiver, class_name: "Chatroom", foreign_key: :reciever_id, dependent: :destroy

  # validates :photo, attached: true, size: { less_than: 20.megabytes , message: 'file is too large' }

end
