# frozen_string_literal: true

class Catalog < SitePrism::Page
  set_url '/books{?query*}'

  sections :books, Books, '.book'
end
