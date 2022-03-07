class CreateChatrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :sender, foreign_key:{ to_table: :users }
      t.references :reciever, foreign_key:{ to_table: :users } 
      t.timestamps
    end
  end
end
