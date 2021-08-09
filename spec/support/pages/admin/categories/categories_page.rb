# frozen_string_literal: true

class CategoriesPage < SitePrism::Page
  set_url '/admin/categories'

  element :create, '[href="/admin/categories/new"]'
  element :edit, '.edit_link'
end
