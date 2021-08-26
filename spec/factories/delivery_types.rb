# frozen_string_literal: true

FactoryBot.define do
  factory :delivery_type do
    name { FFaker::AnimalUS.common_name }
    min_days { rand(1..9) }
    max_days { rand(min_days..min_days * 2) }
    price { rand(30.0) }
  end
end
