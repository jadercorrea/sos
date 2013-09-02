class RemovePasswordFromUsers < ActiveRecord::Migration
  def up
    execute 'alter table users drop column password'
  end

  def down
    add_column :users, :password, :string
  end
end
