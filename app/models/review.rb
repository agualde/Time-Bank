class Review < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :user
  has_one :user_review, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true

  validates_uniqueness_of :user_id, :scope => [:project]

end
