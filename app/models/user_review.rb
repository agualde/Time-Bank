class UserReview < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:review_id]

end
