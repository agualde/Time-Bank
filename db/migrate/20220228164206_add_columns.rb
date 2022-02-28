class AddColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :location, :string
    add_column :projects, :location, :string
    add_column :users, :birthday, :date
  end
end
