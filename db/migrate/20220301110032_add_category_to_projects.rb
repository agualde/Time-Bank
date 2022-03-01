class AddCategoryToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :category, index: true
  end
end
