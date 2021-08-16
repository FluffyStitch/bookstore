# frozen_string_literal: true

class NewCategoryPage < SitePrism::Page
  set_url '/admin/categories/new'

  section :form, '#new_category' do
    element :name, '#category_name'

    element :create, '[type="submit"]'
  end

  element :cancel, '.cancel'
end
