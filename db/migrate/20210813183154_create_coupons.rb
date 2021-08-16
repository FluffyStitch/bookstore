class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.references :order
      t.decimal :discount
      t.string :code
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
