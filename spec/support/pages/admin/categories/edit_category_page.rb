# frozen_string_literal: true

class EditCategoryPage < SitePrism::Page
  set_url '/admin/categories/{id}/edit'

  section :form, '#edit_category' do
    element :name, '#category_name'

    element :edit, '[type="submit"]'
  end

  element :cancel, '.cancel'
end
