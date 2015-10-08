class CreateMakeTranslation < ActiveRecord::Migration
  def self.up
    Make.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Make.drop_translation_table! :migrate_data => true
  end
end
