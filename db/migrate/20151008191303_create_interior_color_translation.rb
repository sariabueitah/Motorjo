class CreateInteriorColorTranslation < ActiveRecord::Migration
  def self.up
    InteriorColor.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    InteriorColor.drop_translation_table! :migrate_data => true
  end
end
