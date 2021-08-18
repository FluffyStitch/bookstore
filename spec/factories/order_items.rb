# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    order { create(:order) }
    book { create(:book) }
    quantity { rand(1..4) }
  end
end
