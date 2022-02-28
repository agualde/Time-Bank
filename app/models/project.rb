class Project < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 250 }
  validates :location, presence: true
end
