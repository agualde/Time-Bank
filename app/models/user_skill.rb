class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates_uniqueness_of :user, :scope => [:skill]
end
