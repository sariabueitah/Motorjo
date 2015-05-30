class RemovegenderFrommembers < ActiveRecord::Migration
  def change
  	remove_column :members, :gender
  	remove_column :members, :date_of_birth
  end
end
