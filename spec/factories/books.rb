# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    price { rand(200).to_f }
    quantity { rand(1..10).to_f }
    description { FFaker::Book.description }
    year_of_publication { rand(1970..2020) }
    height { rand(20).to_f }
    width { rand(20).to_f }
    depth { rand(10).to_f }
    materials { FFaker::AnimalUS.common_name }
    category { create(:category) }
    authors { create_list(:author, rand(1..3)) }
  end
end
