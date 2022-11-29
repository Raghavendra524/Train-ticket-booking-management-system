class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mobile_no, :string
    add_column :users, :gender, :string
    add_column :users, :identity_proof_id, :string
  end
end
