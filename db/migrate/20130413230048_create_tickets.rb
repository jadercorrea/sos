class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :client_id

      t.timestamps
    end
    add_index :tickets, :client_id
  end
end
