class AddColumnsToTables < ActiveRecord::Migration[7.0]
  def change
        add_column :schedules, :train_id ,:integer
        remove_column :tickets, :g_time, :datetime

  end
end
