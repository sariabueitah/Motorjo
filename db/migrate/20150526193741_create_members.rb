class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :gender
      t.date :date_of_birth
      t.text :address

      t.timestamps null: false
    end
  end
end
