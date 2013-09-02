class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :client_id
      t.string :title
      t.text :description
      t.string :situation
      t.integer :user_id

      t.timestamps
    end
  end
end
