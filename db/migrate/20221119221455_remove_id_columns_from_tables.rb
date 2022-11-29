class RemoveIdColumnsFromTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :trains, :train_id, :integer
    remove_column :schedules, :schedule_id, :integer
    remove_column :places, :p_id, :integer
    remove_column :payments, :pay_id, :integer
    remove_column :tickets, :t_id, :integer
    add_column :trains, :added_by_u_id ,:integer
  end
end
