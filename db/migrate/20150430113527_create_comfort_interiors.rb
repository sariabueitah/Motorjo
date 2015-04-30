class CreateComfortInteriors < ActiveRecord::Migration
  def change
    create_table :comfort_interiors do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
