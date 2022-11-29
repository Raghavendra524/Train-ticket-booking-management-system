class AddColumnToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :pass_count, :integer, default: 0
  end
end
