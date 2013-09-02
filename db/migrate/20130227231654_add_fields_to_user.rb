class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer
    add_column :users, :password, :string
  end
end
