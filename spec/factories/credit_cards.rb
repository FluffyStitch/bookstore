# frozen_string_literal: true

FactoryBot.define do
  factory :credit_card do
    order { create(:order) }
    number { Array.new(10) { rand(9) }.join }
    name { FFaker::AnimalUS.common_name }
    validity { "0#{rand(1..9)}/#{Array.new(2) { rand(9) }.join}" }
    cvv { Array.new(rand(3..4)) { rand(9) }.join }
  end
end
