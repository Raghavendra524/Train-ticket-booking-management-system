class AddReferencesToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedules, :train, null: false, foreign_key: true
    add_reference :tickets, :train, null: false, foreign_key: true

    change_table(:schedules) do |s|
        s.references :src_place, foreign_key: { to_table: 'places' }, null: false
        s.references :dst_place, foreign_key: { to_table: 'places' }, null: false
    end
  end
end
