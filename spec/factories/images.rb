# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    image { Rack::Test::UploadedFile.new(Dir[Rails.root.join('spec/fixtures/images/*')].sample, 'image/jpeg') }
    book
  end
end
