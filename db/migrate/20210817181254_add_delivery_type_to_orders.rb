class AddDeliveryTypeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :delivery_type, null: true, foreign_key: true
  end
end
