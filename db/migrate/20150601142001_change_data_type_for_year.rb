class ChangeDataTypeForYear < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.change :year, :string
    end
  end
  def self.down
    change_table :cars do |t|
      t.change :year, :date
    end
  end
end
