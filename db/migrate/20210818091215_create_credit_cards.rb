class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.references :order, null: false, foreign_key: true
      t.string :number
      t.string :name
      t.string :validity
      t.string :cvv

      t.timestamps
    end
  end
end
