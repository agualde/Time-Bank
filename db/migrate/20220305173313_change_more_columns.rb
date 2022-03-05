class ChangeMoreColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :rating

    add_column :reviews, :rating, :integer

  end
end
