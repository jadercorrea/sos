class AddTotalToServiceOrder < ActiveRecord::Migration
  def change
    add_column :service_orders, :total_time, :string
  end
end
