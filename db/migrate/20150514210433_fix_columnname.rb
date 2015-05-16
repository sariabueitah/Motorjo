class FixColumnname < ActiveRecord::Migration
  def change
  	change_table :cars do |t|
      t.rename :report, :report_other
    end
  end
end
