class CreateDesigncis < ActiveRecord::Migration
  def change
    create_table :designcis do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
