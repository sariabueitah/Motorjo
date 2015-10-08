class CreateModelTranslation < ActiveRecord::Migration
  def self.up
    Model.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Model.drop_translation_table! :migrate_data => true
  end
end
