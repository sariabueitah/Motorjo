class CreateInteriorColors < ActiveRecord::Migration
  def change
    create_table :interior_colors do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
