class AddReferencesToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :ticket, foreign_key: true
    remove_column :tickets, :payment_id
    add_reference :tickets, :payment, foreign_key: true

  end
end
