class AddMoreColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :animal_care, :boolean, default: false
    add_column :users, :gardening, :boolean, default: false
    add_column :users, :fitness, :boolean, default: false
    add_column :users, :guitar, :boolean, default: false
    add_column :users, :drummer, :boolean, default: false
    add_column :users, :ableton, :boolean, default: false
    add_column :users, :cooking, :boolean, default: false
    add_column :users, :soccer, :boolean, default: false
    add_column :users, :community, :boolean, default: false
    add_column :users, :baking, :boolean, default: false
    add_column :users, :art, :boolean, default: false
    add_column :users, :design, :boolean, default: false
    add_column :users, :webdev, :boolean, default: false
    add_column :users, :writting, :boolean, default: false
    add_column :users, :tennis, :boolean, default: false
  end
end
