# frozen_string_literal: true

class Books < SitePrism::Section
  element :img, '.thumbnail'
  element :show, '.fa-eye'

  element :title, '.title'
end
