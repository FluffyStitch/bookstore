# frozen_string_literal: true

class AddressFields < SitePrism::Section
  element :first_name, '#first_name'
  element :last_name, '#last_name'
  element :address, '#address'
  element :city, '#city'
  element :zip, '#zip'
  element :country, '#country'
  element :phone, '#phone'
end
