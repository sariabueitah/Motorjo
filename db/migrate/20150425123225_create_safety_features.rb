class CreateSafetyFeatures < ActiveRecord::Migration
  def change
    create_table :safety_features do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
