class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.integer :train_id
      t.string :train_name
      t.integer :train_capacity

      t.timestamps
    end
  end
end
