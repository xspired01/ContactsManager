class AddUserIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :user_id, :integer, null: false
    add_index :contacts, :user_id 
  end
end
