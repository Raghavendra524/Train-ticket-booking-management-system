class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.integer :schedule_id
      t.string :sch_train_id
      t.datetime :starting_time
      t.datetime :reaching_time
      t.integer :src_place_id
      t.integer :dst_place_id
      t.integer :tour_fare

      t.timestamps
    end
  end
end
