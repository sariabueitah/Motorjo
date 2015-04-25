class CreateCarSafetyFeatures < ActiveRecord::Migration
  def change
    create_table :car_safety_features do |t|
      t.integer :car_id
      t.integer :safety_feature_id

      t.timestamps null: false
    end
  end
end
