class AddReportToCars < ActiveRecord::Migration
  def change
    add_column :cars, :report, :integer
  end
end
