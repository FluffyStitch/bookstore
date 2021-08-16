# frozen_string_literal: true

class NewAuthorPage < SitePrism::Page
  set_url '/admin/authors/new'

  section :form, '#new_author' do
    element :first_name, '#author_first_name'
    element :second_name, '#author_second_name'
    element :description, '#author_description'

    element :create, '[type="submit"]'
  end

  element :cancel, '.cancel'
end
