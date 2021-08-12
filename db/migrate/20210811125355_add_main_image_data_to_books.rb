class AddMainImageDataToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :main_image_data, :jsonb, null: false
  end
end
