class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :message
      t.references :ticket

      t.timestamps
    end
    add_index :comments, :ticket_id
  end
end
