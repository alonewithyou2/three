class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      #table.string, creating a column for name,email, and comments
      t.string :name
      t.string :email
      t.text :comments
      t.timestamps
    end
  end
end
