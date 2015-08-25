class AddNameToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :name, :string
  end
end
