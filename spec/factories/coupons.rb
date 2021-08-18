# frozen_string_literal: true

FactoryBot.define do
  factory :coupon do
    discount { rand(0.0..0.6).round(2) }
    code { Array.new(4) { rand(9) }.join }
  end
end
