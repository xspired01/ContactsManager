class AddFirstAndLastNameToContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :name
    add_column :contacts, :first_name, :string
    change_column_null :contacts, :first_name, false, 0
    add_column :contacts, :last_name, :string
  end
end
