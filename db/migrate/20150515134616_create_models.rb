class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.integer :parent_id
      t.string :title

      t.timestamps null: false
    end
  end
end
