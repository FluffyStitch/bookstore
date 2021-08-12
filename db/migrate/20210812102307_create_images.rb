class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.jsonb :image_data, null: false

      t.timestamps
    end
  end
end
