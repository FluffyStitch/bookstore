# frozen_string_literal: true

class Home < SitePrism::Page
  set_url '/'

  elements :latests, '[data-target="#slider"]'

  element :start, '.btn-default'

  elements :bestsellers, '.book'
end
