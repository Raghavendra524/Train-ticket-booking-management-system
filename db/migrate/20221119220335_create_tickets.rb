class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :t_id
      t.integer :sch_id
      t.integer :u_id
      t.integer :no_of_people
      t.integer :total_amount
      t.datetime :g_time

      t.timestamps
    end
  end
end
