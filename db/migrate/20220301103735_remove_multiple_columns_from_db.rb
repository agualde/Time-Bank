class RemoveMultipleColumnsFromDb < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :animal_care
    remove_column :users, :gardening
    remove_column :users, :fitness
    remove_column :users, :guitar
    remove_column :users, :drummer
    remove_column :users, :ableton
    remove_column :users, :cooking
    remove_column :users, :soccer
    remove_column :users, :community
    remove_column :users, :baking
    remove_column :users, :art
    remove_column :users, :design
    remove_column :users, :webdev
    remove_column :users, :writting
    remove_column :users, :tennis

    remove_column :projects, :animal
    remove_column :projects, :garden
    remove_column :projects, :fitness
    remove_column :projects, :music
    remove_column :projects, :cooking
    remove_column :projects, :sports
    remove_column :projects, :community
    remove_column :projects, :webdev
  end
end
