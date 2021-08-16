# frozen_string_literal: true

class OrderItems < SitePrism::Section
  element :minus, '.fa-minus'
  element :plus, '.fa-plus'
  element :delete, '[data-method="delete"]'
end
