class AddEvenMoreColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :username, :string
  end
end
