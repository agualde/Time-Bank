class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :favorite, presence: true
  validates_uniqueness_of :project_id, :scope => [:user_id]
end
