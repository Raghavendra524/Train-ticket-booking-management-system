class RenameColumnForPayment < ActiveRecord::Migration[7.0]
  def change
    rename_column :payments, :type , :type_of_pay
    add_column :payments, :amount , :integer , null: false
  end
end
