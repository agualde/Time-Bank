class AddColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :animal, :boolean, default: false
    add_column :projects, :garden, :boolean, default: false
    add_column :projects, :fitness, :boolean, default: false
    add_column :projects, :music, :boolean, default: false
    add_column :projects, :cooking, :boolean, default: false
    add_column :projects, :sports, :boolean, default: false
    add_column :projects, :community, :boolean, default: false
    add_column :projects, :webdev, :boolean, default: false
  end
end
