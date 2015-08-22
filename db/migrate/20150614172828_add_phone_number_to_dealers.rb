class AddPhoneNumberToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :phone_number, :string
  end
end
