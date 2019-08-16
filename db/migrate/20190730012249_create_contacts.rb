class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false 
      t.string :email
      t.string :phone
      t.string :title
      t.string :company
      t.date :birth_date
      t.string :sex, limit: 1
      t.text :notes 

      t.timestamps 
    end
  end
end
