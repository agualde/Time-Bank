class Review < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }
  validates_uniqueness_of :user_id, :scope => [:project_id]

end
