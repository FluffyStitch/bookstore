# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    book { create(:book) }
    title { FFaker::AnimalUS.common_name }
    text { FFaker::Book.description }
    user { create(:user) }
    status { rand(0..2) }
    score { rand(1..5) }
  end
end
