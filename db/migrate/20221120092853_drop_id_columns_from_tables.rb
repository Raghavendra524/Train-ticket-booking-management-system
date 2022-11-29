class DropIdColumnsFromTables < ActiveRecord::Migration[7.0]
  def change
        remove_column :trains, :added_by_u_id, :integer
        remove_column :schedules, :sch_train_id, :integer
        remove_column :schedules, :src_place_id, :integer
        remove_column :schedules, :dst_place_id, :integer
        remove_column :schedules, :train_id, :integer
        remove_column :tickets, :sch_id, :integer
        remove_column :tickets, :u_id, :integer
        remove_column :tickets, :pay_id, :integer
  end
end
