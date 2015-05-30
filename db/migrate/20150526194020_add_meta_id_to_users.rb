class AddMetaIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :meta_id, :integer
  end
end
