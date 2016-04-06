class CreateAdminMainSliders < ActiveRecord::Migration
  def change
    create_table :admin_main_sliders do |t|
      t.string :title
      t.text :description
      t.integer :order

      t.timestamps null: false
    end
  end
end
