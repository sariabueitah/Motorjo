class AddMobileNumberToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :mobile_number, :string
  end
end
