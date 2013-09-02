class AddDetailsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :price, :decimal
    add_column :clients, :billable_hours, :string
    add_column :clients, :taxes, :string
    add_column :clients, :lunch, :string
    add_column :clients, :status, :string
  end
end
