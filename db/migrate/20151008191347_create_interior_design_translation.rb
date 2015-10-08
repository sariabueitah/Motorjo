class CreateInteriorDesignTranslation < ActiveRecord::Migration
  def self.up
    InteriorDesign.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    InteriorDesign.drop_translation_table! :migrate_data => true
  end
end
