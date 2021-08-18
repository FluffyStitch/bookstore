# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user { nil }
    uniq_number { Array.new(6) { rand(9) }.join }
    status { rand(0..4) }
  end
end
