# frozen_string_literal: true

class BookPage < SitePrism::Page
  set_url '/books/{id}'

  element :price, '.mt-10'
  element :minus, '.fa-minus'
  element :plus, '.fa-plus'
  element :description, '.line-height-2 div'
  element :read_more, '#read_more'
end
