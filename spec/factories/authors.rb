# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    first_name { FFaker::Name.first_name }
    second_name { FFaker::Name.last_name }
    description { FFaker::AnimalUS.common_name }
  end
end
