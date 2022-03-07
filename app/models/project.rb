class Project < ApplicationRecord

  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 140 }
  validates :location, presence: true

  belongs_to :category

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :description, :location ],
    associated_against: {
      user: [ :first_name, :last_name, :bio ]
    },
    using: {
      tsearch: { prefix: true }
    }

  validates :phots, attached: true, size: { less_than: 20.megabytes , message: 'files are too large' }
end
