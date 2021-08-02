# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { ['Mobile development', 'Photo', 'Web design', 'Web development'].sample }
  end
end
