class AddUserIdToTrain < ActiveRecord::Migration[7.0]
  def change
    add_reference :trains, :user, null: false, foreign_key: true
    add_reference :tickets, :user, null: false, foreign_key: true
    add_reference :schedules, :user, null: false, foreign_key: true
    add_reference :places, :user, null: false, foreign_key: true
    add_reference :payments, :user, null: false, foreign_key: true
  end
end
