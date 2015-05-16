class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
