class AddReportIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :report, :text
  end
end
