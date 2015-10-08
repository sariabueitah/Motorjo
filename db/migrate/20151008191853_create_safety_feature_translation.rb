class CreateSafetyFeatureTranslation < ActiveRecord::Migration
  def self.up
    SafetyFeature.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    SafetyFeature.drop_translation_table! :migrate_data => true
  end
end
