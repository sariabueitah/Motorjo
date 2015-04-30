class CreateInteriorDesigns < ActiveRecord::Migration
  def change
    create_table :interior_designs do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
