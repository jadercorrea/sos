class AddFieldsToServiceOrder < ActiveRecord::Migration
  def change
    add_column :service_orders, :user_id, :int
  end
end
