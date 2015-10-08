class CreateComfortInteriorTranslation < ActiveRecord::Migration
  def self.up
    ComfortInterior.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    ComfortInterior.drop_translation_table! :migrate_data => true
  end
end
