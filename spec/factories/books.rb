# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    price { rand(200.0) }
    quantity { rand(1..10) }
    description { FFaker::Book.description }
    year_of_publication { rand(1970..2020) }
    height { rand(20.0) }
    width { rand(20.0) }
    depth { rand(10.0) }
    materials { FFaker::AnimalUS.common_name }
    category factory: :category
    authors { create_list(:author, rand(1..3)) }
  end
end
