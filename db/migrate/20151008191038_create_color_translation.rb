class CreateColorTranslation < ActiveRecord::Migration
  def self.up
    Color.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Color.drop_translation_table! :migrate_data => true
  end
end
