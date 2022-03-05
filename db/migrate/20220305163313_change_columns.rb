class ChangeColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :project_id

    add_column :reviews, :project, :string

  end
end
