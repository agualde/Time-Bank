class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :status, inclusion: { in: %w[Pending Approved Declined] }
  validates :status, presence: true
end
