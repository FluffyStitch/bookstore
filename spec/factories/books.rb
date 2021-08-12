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

    trait :with_images do
      main_image { Rack::Test::UploadedFile.new(Dir[Rails.root.join('spec/fixtures/images/*')].sample, 'image/jpeg') }
      after(:build) { |book, _| create_list(:image, rand(1..3), book: book) }
    end
  end
end
