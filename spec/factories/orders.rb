# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user { nil }
    status { rand(0..4) }
  end
end
