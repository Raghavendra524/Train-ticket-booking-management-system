class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.integer :p_id
      t.string :name

      t.timestamps
    end
  end
end
