class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :book, null: false, foreign_key: true
      t.string :title
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.integer :score

      t.timestamps
    end
  end
end
