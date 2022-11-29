class AddColumnToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :pay_id, :integer
  end
end
