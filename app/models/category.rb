class Category < ApplicationRecord
  has_many :projects

  validates :name, uniqueness: true
end
