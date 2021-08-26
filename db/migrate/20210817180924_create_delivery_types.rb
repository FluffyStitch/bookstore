class CreateDeliveryTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_types do |t|
      t.string :name, null: false
      t.integer :min_days, null: false
      t.integer :max_days, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
