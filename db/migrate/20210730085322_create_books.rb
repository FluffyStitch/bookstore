class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.decimal :price
      t.integer :quantity
      t.text :description
      t.integer :year_of_publication
      t.decimal :height
      t.decimal :width
      t.decimal :depth
      t.string :materials
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
