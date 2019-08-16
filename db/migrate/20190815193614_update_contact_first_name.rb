class UpdateContactFirstName < ActiveRecord::Migration[5.2]
  def change
    change_column_null :contacts, :first_name, true
  end
end
