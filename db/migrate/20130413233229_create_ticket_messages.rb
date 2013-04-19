class CreateTicketMessages < ActiveRecord::Migration
  def change
    create_table :ticket_messages do |t|
      t.string :text
      t.integer :ticket_id

      t.timestamps
    end
    add_index :ticket_messages, :ticket_id
  end
end
