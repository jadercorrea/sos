class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.references :client, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
