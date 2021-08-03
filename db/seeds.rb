require 'ffaker'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.all.count == 0

categories = ['Mobile development', 'Photo', 'Web design', 'Web development'].map { |category_name| Category.create(name: category_name) }
authors = Array.new(5) { Author.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name) }
16.times do
  Book.create(title: FFaker::Book.title,
              price: rand(200.0),
              quantity: rand(1..10),
              description: FFaker::Book.description,
              year_of_publication: rand(1970..2020),
              height: rand(20.0),
              width: rand(20.0),
              depth: rand(10.0),
              materials: FFaker::AnimalUS.common_name,
              category: categories.sample,
              authors: authors.sample(1..3))
end
