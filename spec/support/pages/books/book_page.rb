# frozen_string_literal: true

class BookPage < SitePrism::Page
  set_url '/books/{id}'

  element :price, '.mt-10'
  element :minus, '.fa-minus'
  element :plus, '.fa-plus'
  element :shop, '[value="Add to Cart"]'
  element :description, '.line-height-2 div'
  element :read_more, '#read_more'

  elements :stars, '[id^=star-]'
  section :form, '#new_review' do
    element :title, '#review_title'
    element :text, '#review_text'

    element :post, '[type="submit"]'
  end
end
