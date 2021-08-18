# frozen_string_literal: true

class Books < SitePrism::Section
  element :img, '.thumbnail'
  element :show, '.fa-eye'
  element :shop, '.fa-shopping-cart'

  element :title, '.title'
end
