# frozen_string_literal: true

class EditAuthorPage < SitePrism::Page
  set_url '/admin/authors/{id}/edit'

  section :form, '#edit_author' do
    element :first_name, '#author_first_name'
    element :second_name, '#author_second_name'
    element :description, '#author_description'

    element :edit, '[type="submit"]'
  end

  element :cancel, '.cancel'
end
