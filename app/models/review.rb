class Review < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  
  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true

  validates_uniqueness_of :user_id, :scope => [:project]

end
