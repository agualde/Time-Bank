class Skill < ApplicationRecord
  belongs_to :user, through: :user_skills
end
