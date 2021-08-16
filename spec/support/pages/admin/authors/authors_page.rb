# frozen_string_literal: true

class AuthorsPage < SitePrism::Page
  set_url '/admin/authors'

  element :create, '[href="/admin/authors/new"]'
  element :edit, '.edit_link'
end
