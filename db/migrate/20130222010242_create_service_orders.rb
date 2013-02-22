class CreateServiceOrders < ActiveRecord::Migration
  def change
    create_table :service_orders do |t|
      t.references :client
      t.string :module
      t.string :project
      t.date :date
      t.string :reason
      t.string :requestor
      t.string :start_time
      t.string :end_time
      t.string :non_billable_hours
      t.string :other_billable_hours
      t.text :description
      t.text :comment

      t.timestamps
    end
    add_index :service_orders, :client_id
  end
end
