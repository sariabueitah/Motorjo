class CreateCardesigncis < ActiveRecord::Migration
  def change
    create_table :cardesigncis do |t|
      t.integer :car_id
      t.integer :designci_id

      t.timestamps null: false
    end
  end
end
