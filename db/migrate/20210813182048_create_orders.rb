class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :uniq_number, unique: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
