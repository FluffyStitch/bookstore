# frozen_string_literal: true

class EditBookPage < SitePrism::Page
  set_url '/admin/books/{id}/edit'

  section :form, '#edit_book' do
    element :category, '#book_category_id'
    element :title, '#book_title'
    element :price, '#book_price'
    element :quantity, '#book_quantity'
    element :description, '#book_description'
    element :year_of_publication, '#book_year_of_publication'
    element :height, '#book_height'
    element :width, '#book_width'
    element :depth, '#book_depth'
    element :materials, '#book_materials'
    elements :authors, '[type="checkbox"]'
    element :main_image, '#book_main_image'
    element :add_new_image, '.has_many_add'
    element :image, '#book_images_attributes_0_image'

    element :edit, '[type="submit"]'
  end

  element :cancel, '.cancel'
end
