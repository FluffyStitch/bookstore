# frozen_string_literal: true

class BooksPage < SitePrism::Page
  set_url '/admin/books'

  element :create, '[href="/admin/books/new"]'
  element :edit, '.edit_link'
  element :view, '.view_link'
end
