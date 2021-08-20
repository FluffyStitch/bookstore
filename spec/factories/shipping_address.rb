# frozen_string_literal: true

FactoryBot.define do
  factory :shipping_address do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city_prefix }
    zip { FFaker::AddressUS.zip_code }
    country { ISO3166::Country.countries.sample.name }
    phone { "+#{ISO3166::Country.find_country_by_name(country).country_code}#{Array.new(9) { rand(9) }.join}" }
    type { I18n.t('address_class.shipping') }
  end
end
