class UserReview < ApplicationRecord
  has_many :users

  validates_uniqueness_of :user_id, :scope => [:review_id]

end
